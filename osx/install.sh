#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

curl -O https://raw.github.com/altercation/solarized/master/osx-terminal.app-colors-solarized/xterm-256color/Solarized%20Light%20xterm-256color.terminal
open "Solarized%20Light%20xterm-256color.terminal"
sleep 1
curl -O https://raw.github.com/altercation/solarized/master/osx-terminal.app-colors-solarized/xterm-256color/Solarized%20Dark%20xterm-256color.terminal
open "Solarized%20Dark%20xterm-256color.terminal"
sleep 1


# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "HallidayBook Pro"
sudo scutil --set HostName "HallidayBook Pro"
sudo scutil --set LocalHostName "HallidayBook-Pro"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "HallidayBook-Pro"

defaults write com.apple.LaunchServices LSQuarantine -bool false

defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

sudo pmset -a sleep 600

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Automatically illuminate built-in MacBook keyboard in low light
defaults write com.apple.BezelServices kDim -bool true
# Turn off keyboard illumination when computer is not used for 5 minutes
defaults write com.apple.BezelServices kDimTime -int 300

systemsetup -settimezone "America/Chicago" > /dev/null

defaults write com.twitter.twitter-mac UserTimelineDerepeater -bool true

defaults write com.twitter.twitter-mac openLinksInBackground -bool true

defaults write com.twitter.twitter-mac ShowDevelopMenu -bool true

defaults write com.twitter.twitter-mac HideInBackground -bool true

defaults write com.twitter.twitter-mac ESCClosesComposeWindow -bool true

defaults write com.twitter.twitter-mac MenuItemBehavior -int 1

defaults write com.apple.appstore WebKitDeveloperExtras -bool true

defaults write com.apple.appstore ShowDebugMenu -bool true

defaults write com.apple.addressbook ABShowDebugMenu -bool true

defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true

defaults write com.apple.terminal StringEncodings -array 4

defaults write com.apple.terminal "Default Window Settings" -string "Solarized Dark xterm-256color"
defaults write com.apple.terminal "Startup Window Settings" -string "Solarized Dark xterm-256color"

defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\\U21a9"\\

defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

defaults write com.apple.mail MailSentSoundPath dummy

defaults write NSGlobalDomain AppleShowAllExtensions -bool true

defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -int 0

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

defaults write com.apple.CrashReporter DialogType none

defaults write com.apple.finder WarnOnEmptyTrash -bool false

defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

defaults write com.apple.dock use-new-list-stack -bool YES

defaults write com.apple.screensaver askForPassword -int 1
defaults -currentHost write com.apple.screensaver askForPasswordDelay -int 0

defaults write com.apple.Finder FXPreferredViewStyle type Nlsv

defaults write com.apple.QuickTimePlayerX MGFullScreenExitOnAppSwitch 0

sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ScheduleFrequency 1

defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

defaults write com.apple.dock mouse-over-hilite-stack -bool true

defaults write com.apple.finder QLEnableTextSelection -bool TRUE

defaults write com.apple.Safari IncludeInternalDebugMenu 1

defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

defaults write com.apple.finder EmptyTrashSecurely -bool true

chflags nohidden ~/Library

defaults write NSGlobalDomain com.apple.springing.enabled -bool true

defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

defaults write com.apple.screencapture location ~/Pictures

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE

defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

defaults write com.apple.Finder AppleShowAllFiles -bool true

defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true




