#!/bin/bash

echo -e "\e[1;32mInitializing Lunar Workstation...\e[0m"

function log {
  echo -e "\e[1;31m>> \e[1;34m$1\e[0m"
}

export PATH=$PATH:$HOME/bin

WORK_DIR=/tmp/lunar-station-`date +%s`
mkdir -p $WORK_DIR
cd $WORK_DIR

if [ $OSTYPE == "linux-gnu" ]; then
  OS="linux"
  if [ -x /usr/bin/apt-get ]; then
    PLATFORM="ubuntu"
    log "Ubuntu/Debian Linux detected."
  elif [ -x /usr/bin/yum ]; then
    PLATFORM="fedora"
    log "Fedora Linux detected."
  fi
else # TODO: check if it's "darwin*"
  OS="osx"
  PLATFORM="darwin"
  log "Mac OSX detected."
fi

if [ $PLATFORM = "ubuntu" ]; then
  log "Refreshing apt database..."
  sudo apt-get update >/dev/null 2>&1

  log "Making sure curl is installed..."
  sudo apt-get -y install curl >/dev/null
fi

log "Checking for RVM..."
if [ ! -d ~/.rvm ]; then
  log "RVM not found, installing..."
  curl -s https://rvm.beginrescueend.com/install/rvm -o rvm-installer && chmod +x rvm-installer && ./rvm-installer --version latest || exit 1

  log "Adding bundler and capistrano to global gemset list for all rubies..."
  echo "bundler" >>~/.rvm/gemsets/global.gems
  echo "capistrano" >>~/.rvm/gemsets/global.gems
  echo "capistrano-ext" >>~/.rvm/gemsets/global.gems

  log "Appending RVM function to your .bash_profile..."
  grep "scripts/rvm" ~/.bash_profile >/dev/null 2>&1 || echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function' >> ~/.bash_profile
  . ~/.rvm/scripts/rvm

  log "Installing ruby 1.9.2..."
  if [ $PLATFORM = "ubuntu" ]; then
    sudo apt-get -y install build-essential bison openssl libreadline6 libreadline6-dev zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-0 libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev
  elif [ $PLATFORM = "fedora" ]; then
    sudo yum -y install gcc gcc-c++ make patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel bzip2
  fi

  rvm install 1.9.2 && rvm use 1.9.2 --default
fi

if [ -z $(which chef-solo 2>/dev/null) ]; then
  log "Installing chef gem..."
  gem install chef --no-ri --no-rdoc >/dev/null || exit 1
fi

if [ -n "$1" ]; then
  DEV_TYPE=$1
else
  DEV_TYPE="rubydev"
fi

log "Fetching latest version of Lunar Station cookbooks..."
curl -sL -o lunar-station.tar.gz https://github.com/LunarLogicPolska/lunar-station/tarball/master || exit 1
tar xf lunar-station.tar.gz || exit 1
cd `tar tf lunar-station.tar.gz | head -1`

log "Starting chef-solo run..."
rvmsudo chef-solo -c config/solo.rb -j nodes/$OS-$DEV_TYPE.json
