#!/usr/bin/env bash

# Get the installation functions. Things are broken up this way
# in order to allow packages with varying dep requirements accross
# sources to be met.


# Ask for the administrator password upfront
sudo -v
# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

source ./brew.sh
source ./pip.sh

install_brew
brew_install_core_utils
brew_install_encryption
brew_install_bash4
brew_install_zsh_env
# TODO: need to set the fonts in the term settings as well
brew_install_terminals
brew_install_font_tools

# Will run the mac setup scripts
# source ./macos

brew_install_db
brew_install_ctf_tools
brew_install_licensed_apps
brew_install_gaming
brew_install_gamedev
brew_install_communication
brew_install_browsers
brew_install_media_tools
brew_install_misc
