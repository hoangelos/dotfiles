#!/bin/bash

sudo -v

git pull
function doIt() {
	rsync --exclude ".git/" --exclude "homebrew/" --exclude "osx/" --exclude "python/" --exclude "rvm/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "sublime_text_2/" --exclude "README.md" -av . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt

source ~/.bash_profile

./osx/install.sh

./homebrew/install.sh

./python/install.sh

./rvm/install.sh

./aws/install.sh

cp -vaR sublime_text_2/  ~/Library/Application\ Support/Sublime\ Text\ 2/

cp -vaR .openshift ~/.openshift/


mkdir -p ~/bin

sudo ln -s /Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl ~/bin/sublime
