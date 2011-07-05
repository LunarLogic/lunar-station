    .____                               
    |    |    __ __  ____ _____ _______ 
    |    |   |  |  \/    \\__  \\_  __ \
    |    |___|  |  /   |  \/ __ \|  | \/
    |_______ \____/|___|  (____  /__|   
            \/          \/     \/       
      _________ __          __  .__               
     /   _____//  |______ _/  |_|__| ____   ____  
     \_____  \\   __\__  \\   __\  |/  _ \ /    \ 
     /        \|  |  / __ \|  | |  (  <_> )   |  \
    /_______  /|__| (____  /__| |__|\____/|___|  /
            \/           \/                    \/ 


# About

Lunar Station is a set of Chef cookbooks and a bash script for bootstrapping
developers machines at Lunar Logic Polska.

Its goal is to make automatic, repetitive installation of common software
developers need easy and in the shape of single command.

It supports Linux (Fedora, Ubuntu) and Mac OSX (10.5+).

# Installed software list

Lunar Station installs following:

* build tools (Linux only)
* RVM + Ruby 1.9.2 (with bundler and capistrano)
* Homebrew (OSX only)
* git
* ack
* curl
* wget
* ctags
* (G)vim (Linux), MacVim (OSX)
* MySQL client, server, dev libs and headers
* libxml2
* Firefox
* Google Chrome
* Skype

On Linux the packages are installed from distro repositories. Packages not
available in official repositories are installed from custom, vendor provided
repos.

On OSX Homebrew is installed first and most of above packages are then
installed with brew. Packages not available via Homebrew are installed from DMG
files downloaded from vendor sites.

# Requirements

Curl or wget.

## Mac OSX

Xcode is required as it's the most reliable way to get build tools (gcc and
family) on OSX system.

# Usage

* install fresh Ubuntu, Fedora or OSX system
* install Xcode if on OSX
* run following in terminal:

        $ curl -skL http://bit.ly/lunar-station | DEV_TYPE=rubydev bash

    or if curl is not installed but wget is:

        $ wget -qO - http://bit.ly/lunar-station | DEV_TYPE=rubydev bash

    or just manually download the bootstrap script and run it with bash:

        $ DEV_TYPE=rubydev bash lunar-station

    where "lunar-station" is name of downloaded file with bootstrap script.

DEV\_TYPE can be one of following:

* rubydev - for Ruby on Rails developer
* javadev - for Java developer

# Development

If you want to help you can clone this repository and work on improvements
locally. After doing some changes you can run bootstrap script from inside of
project directory like this:

    $ DEV_TYPE=rubydev ./bootstrap.sh

This will use local cookbooks copy instead of fetching them from github repo.

# Authors

Marcin Kulik
