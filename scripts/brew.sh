#!/usr/bin/env bash

install_brew() {
	which -s brew
	if [[ $? != 0 ]] ; then
	    # Install Homebrew
	    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	fi
	brew tap bramstein/webfonttools
	brew tap homebrew/cask-fonts
	brew tap homebrew/cask-versions
	# Make sure we’re using the latest Homebrew.
	brew update
	brew upgrade
	# Remove outdated versions from the cellar.
	brew cleanup
}

brew_install_core_utils() {
	# Install GNU core utilities (those that come with macOS are outdated).
	brew install coreutils # Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
	brew install moreutils # Install some other useful utilities like `sponge`.
	brew install findutils # Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
	brew install gnu-sed --with-default-names # Install GNU `sed`, overwriting the built-in `sed`.
	brew install ack
	brew install adns
	# brew install openshift-cli
	brew install awscli
	brew install wget --with-iri # Install `wget` with IRI support.
	brew install --cask osxfuse
	brew install --cask xquartz
	brew install --cask keepingyouawake
	brew install --cask adoptopenjdk
	# brew install --cask dropbox
	# Install more recent versions of some macOS tools.
	# brew install vim --with-override-system-vi
	brew install grep
	brew install mackup
}

brew_install_fonts() {
	brew install --cask font-hack-nerd-font
	brew install --cask font-3270-nerd-font
}

brew_install_encryption() {
	brew install gnupg # Install GnuPG to enable PGP-signing commits.
	brew install libassuan
	brew install openssl
	brew install ssh-copy-id
	brew install openssh
	brew install --cask gpg-suite
	brew install --cask veracrypt
	# brew install --cask exodus # TODO: If PERSONAL
}

#  NOT SURE IF I NEED THIS CRAP ANYMORE
# brew_install_bash4() {
# 	brew install bash
# 	brew install bash-completion2
# 	# if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
# 	# 	echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
# 	# fi;
# }

brew_install_zsh_env() {
	# TODO: check if zsh is installed or not already
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
	brew install neofetch
	if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
		echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
	fi;
}

brew_install_terminals() {
	brew install --cask iterm2
	brew install exa
	# brew install --cask kitty
}

brew_install_db() {
	# brew install mongodb # NOT FOUND
	brew install postgresql
	brew install sqlite
	brew install mysql-client
	brew install --cask dbeaver-enterprise
}

brew_install_font_tools() {
	# Install font tools.
	brew install sfnt2woff
	brew install sfnt2woff-zopfli
	brew install woff2
	brew install fontconfig
	brew install freetype
}

brew_install_ctf_tools() {
 # Install some CTF tools; see https://github.com/ctfs/write-ups.
 brew install aircrack-ng
 brew install bfg
 brew install binutils
 brew install binwalk
 brew install cifer
 brew install dex2jar
 brew install dns2tcp
 brew install fcrackzip
 brew install foremost
 brew install hashpump
 brew install hydra
 brew install john
 brew install knock
 brew install netpbm
 brew install nmap
 brew install pngcheck
 brew install socat
 brew install sqlmap
 brew install tcpflow
 brew install tcpreplay
 brew install tcptrace
 brew install ucspi-tcp # `tcpserver` etc.
 brew install xpdf
 brew install xz
 brew install shellcheck
 brew install spim
 brew install wget
 brew install go
 brew install ant
 brew install eigen
}

brew_install_licensed_apps() {
	brew install --cask istat-menus
	brew install --cask 1password
	brew install --cask daisydisk
	# brew install --cask microsoft-office
	# brew install --cask airmail-beta
	brew install --cask alfred
	brew install --cask bartender
	brew install --cask dash
	brew install --cask little-snitch
	brew install --cask micro-snitch
	brew install --cask ipartition
	brew install --cask fantastical
}

brew_install_gaming() {
  echo "nothing"
  # brew install --cask wine-stable
	# brew install --cask battle-net
	# brew install --cask wineskin-winery
	# brew install --cask steam
	# brew install --cask firestormos
}

brew_install_gamedev() {
  echo 'nothing'
	# brew install --cask epic-games
	# brew install --cask unity
}

brew_install_communication() {
	# brew install --cask discord
	brew install --cask slack
	# echo 'Installing Slack Dark Theme'
	# curl -s https://raw.githubusercontent.com/caiceA/slack-black-theme/master/blackSlack.sh | bash -s
	# brew install --cask zoom
	# brew install --cask chatology
}

brew_install_browsers() {
	brew install --cask google-chrome
	brew install --cask google-chrome-canary
	brew install --cask firefox
}

brew_install_media_tools() {
	brew install ffmpeg
	brew install imagemagick --with-webp
	brew install --cask vlc
	# Metadata anonymization toolkit
	brew install mat
}

brew_install_misc() {
	# TODO: break this up a bit more
	brew install opencv
	brew install terminal-notifier
	brew install libgcrypt
	brew install libgpg-error
	brew install pv
	# Cross-platform application and UI framework
	brew install qt
	brew install unrar
	brew install unzip
	brew install x264
	brew install xvid
	brew install gcc
	brew install glib
	brew install lynx
	brew install p7zip # 7z
	brew install pigz  # gz
	brew install pv # monitor pipe
	brew install rename
	brew install tree
	brew install vbindiff
	brew install ansible
	brew install apache-zeppelin
	brew install flow
	brew install --cask virtualbox
	brew install --cask docker
	brew install --cask wifi-explorer
	brew install --cask hazel
	brew install --cask textual
	# brew install --cask freecad
	brew install --cask postman
	brew install --cask appcleaner
	brew install --cask geektool
	brew install --cask atom
	brew install --cask jetbrains-toolbox
	brew install git
	brew install git-lfs
	brew install --cask gitkraken
	brew install --cask kdiff3
	brew install --cask sourcetree
	# brew install --cask kindle
	brew install --cask spectacle
	brew install --cask wireshark-chmodbpf
	brew install --cask beamer
	brew install --cask libreoffice
	brew install --cask spotify
	brew install --cask cakebrew
	brew install --cask cardhop
	brew install --cask grammarly
	brew install --cask mactracker
	# brew install --cask teamviewer
	brew install --cask charles
	brew install --cask hex-fiend
	brew install --cask meld
	# brew install --cask transmission
	brew install --cask timely
}

# Deprecated stuff maybe... delete after verifying procedure works as is
# brew install icu4c
# brew install ilmbase
# brew install isl
# brew install lame
# brew install libdnet
# brew install libffi
# brew install libidn2
# brew install libksba
# brew install libmpc
# brew install libpng
# brew install libtasn1
# brew install libtiff
# brew install libtool
# brew install libunistring
# brew install libusb
# brew install libyaml
# brew install little-cms2
# brew install meson
# brew install mpfr
# brew install nettle
# brew install ninja
# brew install npth
# brew install openexr
# brew install openjpeg
# brew install p11-kit
# brew install pcre
# brew install perl
# brew install pinentry
# brew install pixman
# brew install pkg-config
# brew install poppler
# brew install readline
# brew install ssdeep
# brew install gnutls
# brew install gettext
# brew install gdbm
# brew install lua
# Text based web browser
# brew install cairo

# Remove outdated versions from the cellar.
# brew cleanup

# echo "******************** COMPLETED BREW INSTALLATION ********************"
# echo "add `/usr/local/bin/bash` to `/etc/shells`"
# echo "add `/usr/local/bin/zsh` to `/etc/shells`"
