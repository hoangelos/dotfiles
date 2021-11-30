#!/bin/bash

sudo -v

download https://mediaserver.thinkorswim.com/installer/InstFiles/thinkorswim_installer.dmg
install-app thinkorswim_installer.dmg

download https://download.jetbrains.com/idea/ideaIC-2021.2.3-aarch64.dmg?_gl=1*12a15e2*_ga*MTQ0ODI2MTQyMy4xNjMzNDg2NTk0*_ga_V0XZL7QHEB*MTYzODE1NDc1Mi4xLjEuMTYzODE1NDc5NS42MA..&_ga=2.209760213.1367344757.1638154753-1448261423.1633486594
install-app ideaIC-2021.2.3-aarch64.dmg

download https://update-cardano-mainnet.iohk.io/daedalus-4.5.2-mainnet-19820.pkg?t=1638154946344
installer -pkg ./daedalus-4.5.2-mainnet-19820.pkg -target /

download https://desktop.docker.com/mac/main/arm64/Docker.dmg?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-mac-arm64
install-app Docker.dmg


