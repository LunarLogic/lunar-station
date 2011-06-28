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
* RVM + Ruby 1.9.2
* Homebrew (OSX only)
* git
* ack
* curl
* wget
* MySQL client, server and dev libs/headers
* libxml2
* Firefox
* Google Chrome
* Skype

On Linux the packages are installed from distro repositories. Packages not
available in repositories are installed from .deb or .rpm files downloaded from
vendor sites.

On OSX Homebrew is installed first and most of above packages are then
installed with brew. Packages not available from Homebrew are installed from DMG
files downloaded from vendor sites.

# Requirements

## Linux

Nothing really. Ruby (1.8.6+) and Rubygems are required for Chef but Lunar
Station bootstrap script checks for them and installs them automatically if
needed on Fedora and Ubuntu systems from distro repos. For other distros just
install ruby (with dev headers) and rubygems.

## Mac OSX

Xcode is required as it's the most reliable way to get build tools (gcc and
family) on OSX system.

# Usage

* install fresh Ubuntu, Fedora or OSX system
* install Xcode if on OSX
* run following in terminal:

        $ curl -skL http://bit.ly/lunar-station | bash

    or if curl is not installed but wget is:

        $ wget -qO - http://bit.ly/lunar-station | bash

    or just manually download the bootstrap script and run it with bash:

        $ bash lunar-station (<- downloaded file)
