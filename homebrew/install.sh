#!/bin/bash

# Install Homebrew
ruby <(curl -fsSkL raw.github.com/mxcl/homebrew/go)

brew install findutils
brew install coreutils
echo "Don’t forget to add $(brew --prefix coreutils)/libexec/gnubin to \$PATH."
brew install openssl
brew install readline

brew install gcc

brew install pyenv
brew install poetry
brew install pipenv
brew install pyenv-virtualenv
brew install direnv

brew install jq
brew install node

brew instsall jenv

brew install git

brew install lynx
brew install curl

brew install helm
brew install kustomize

brew install hugo

brew cleanup
