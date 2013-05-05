#!/bin/bash

# RVM Install
curl -L https://get.rvm.io | bash -s stable

cp rvm/*.gems ~/.rvm/gemsets

rvm autolibs enable
rvm install 1.9.3
rvm alias create default ruby-1.9.3
rvm use 1.9.3
