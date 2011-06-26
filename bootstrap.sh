#!/bin/bash

echo -e "\e[1;34mInitializing Lunar Workstation...\e[0m"

if [ -z $1 ]; then
  echo -e "\e[1;31mPlease specify workstation type.\e[0m"
  exit 1
fi

if [ -x /usr/bin/apt-get ]; then
  sudo apt-get update >/dev/null 2>&1
fi

CHEF_SOLO_BIN=$(which chef-solo 2>/dev/null)
GEM_BIN=$(which gem 2>/dev/null)

if [ -z $CHEF_SOLO_BIN ]; then
  if [ -z $GEM_BIN ]; then
    echo -e "\e[1;32mRuby and/or Rubygems not found, installing...\e[0m"
    if [ -x /usr/bin/yum ]; then
      sudo yum -y install ruby ruby-devel rubygems
    elif [ -x /usr/bin/apt-get ]; then
      sudo apt-get -y install ruby ruby-dev rubygems
    else
      echo -e "\e[1;31mPlease install ruby and rubygems.\e[0m"
      exit 1
    fi
  fi

  echo -e "\e[1;32mInstalling chef gem...\e[0m"
  sudo gem install chef --no-ri --no-rdoc
fi

# cd /tmp

RVM_SUDO_BIN=$(which rvmsudo 2>/dev/null)

if [ -z $RVM_SUDO_BIN ]; then
  SUDO_CMD=sudo
else
  SUDO_CMD=rvmsudo
fi

echo -e "\e[1;32mStarting chef-solo run...\e[0m"
$SUDO_CMD chef-solo -c config/solo.rb -j nodes/$1.json
