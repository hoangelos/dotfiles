#!/bin/bash

# Install Homebrew
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)

brew install findutils
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."

brew tap homebrew/dupes
brew tap homebrew/dupes
brew install apple-gcc42
sudo ln -s /usr/local/bin/gcc-4.2 /usr/bin/gcc-4.2

brew install clojure
brew install leinengen 2.1.3
brew install homebrew/dupes/grep
brew install git

brew install webkit2png
brew install rhino
brew install lynx
brew install ack
brew install nodejs
brew install mysql
brew install redis
brew install hub
brew install v8

npm install -g m

brew cleanup
