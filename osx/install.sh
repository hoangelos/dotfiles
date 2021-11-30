#!/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.osx` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

sudo softwareupdate --schedule OFF

chsh -s /bin/bash

curl -O https://raw.github.com/altercation/solarized/master/osx-terminal.app-colors-solarized/xterm-256color/Solarized%20Light%20xterm-256color.terminal
open "Solarized%20Light%20xterm-256color.terminal"
sleep 1
curl -O https://raw.github.com/altercation/solarized/master/osx-terminal.app-colors-solarized/xterm-256color/Solarized%20Dark%20xterm-256color.terminal
open "Solarized%20Dark%20xterm-256color.terminal"
sleep 1

defaults write com.apple.menuextra.clock DateFormat -string 'EEE MMM d  j:mm a'
defaults write com.apple.menuextra.battery ShowPercent -string "YES"
defaults write com.apple.menuextra.battery ShowTime -string "YES"

defaults write com.apple.systemuiserver "NSStatusItem Visible Siri" -bool false
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.airplay" -bool true
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.airport" -bool true
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.appleuser" -bool true
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.battery" -bool true
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -bool true
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.clock" -bool true
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -bool true
defaults write com.apple.systemuiserver menuExtras -array \
  "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
  "/System/Library/CoreServices/Menu Extras/Displays.menu" \
  "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
  "/System/Library/CoreServices/Menu Extras/Battery.menu" \
  "/System/Library/CoreServices/Menu Extras/Clock.menu" \
  "/System/Library/CoreServices/Menu Extras/User.menu" \
  "/System/Library/CoreServices/Menu Extras/Volume.menu"


defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false

sudo pmset -a standbydelaylow 3600
sudo pmset -a highstandbythreshold 40
sudo pmset -a standbydelayhigh 10800

### Display sleep: 10 min
sudo pmset -b displaysleep 10

### Put the hard disk(s) to sleep when possible: 10 min
sudo pmset -b disksleep 10

### Slightly dim the display when using this power source
sudo pmset -b lessbright 0

### Automatically reduce brightness before display goes to sleep
sudo pmset -b halfdim 0

### Restart automatically if the computer freezes
sudo pmset -b panicrestart 15
sudo pmset -a hibernatemode 0
sudo pmset -a sms 0
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

### Wake for network access
/usr/bin/sudo /usr/bin/pmset -c womp 1

### Automatically reduce brightness before display goes to sleep
sudo pmset -c halfdim 0

defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

sudo pmset -a lidwake 1

### Start up automatically after a power failure
sudo pmset -c autorestart 1

### Restart automatically if the computer freezes
sudo pmset -c panicrestart 15

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

#defaults write come.apple.loginwindow LoginwindowText -string "If this Mac is found, please call 607-329-6905"

defaults write com.apple.BezelServices kDim -bool true
defaults write com.apple.BezelServices kDimTime -int 300
defaults write com.apple.BezelServices 'dAuto' -bool false

sudo systemsetup -settimezone "America/Chicago" > /dev/null
sudo systemsetup -setrestartfreeze on
sudo systemsetup -setusingnetworktime on
sudo systemsetup -setcomputersleep 10
sudo systemsetup -setdisplaysleep 10
sudo systemsetup -setharddisksleep 15

defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.commerce AutoUpdate -bool true
defaults write com.apple.commerce AutoUpdateRestartRequired -bool false
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1


defaults write com.apple.appstore WebKitDeveloperExtras -bool true
defaults write com.apple.appstore ShowDebugMenu -bool true

defaults write com.apple.Addressbook ABShowDebugMenu -bool true

defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true
defaults write com.apple.DiskUtility advanced-image-options -bool true
defaults write com.apple.DiskUtility DUShowEveryPartition -bool true

defaults write com.apple.Terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Solarized%20Dark%20xterm-256color"
defaults write com.apple.Terminal "Startup Window Settings" -string "Solarized%20Dark%20xterm-256color"

sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"

defaults write com.docker.docker SUAutomaticallyUpdate -bool true
defaults write com.docker.docker SUEnableAutomaticChecks -bool true
defaults write com.docker.docker SUUpdateRelaunchingMarker -bool true

defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
defaults write com.apple.ActivityMonitor SortDirection -int 0
defaults write com.apple.ActivityMonitor SelectedTab -int 1
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true


defaults write com.apple.mail SendWindowsFriendlyAttachments -bool true
defaults write com.apple.mail NSUserKeyEquivalents -dict-add "Send" "@\\U21a9"\\
defaults write com.apple.mail MailSentSoundPath dummy
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

defaults write com.apple.iTunes NSUserKeyEquivalents -dict-add "Target Search Field" "@F"

defaults write com.apple.CrashReporter DialogType none

defaults write com.apple.DiskUtility DUDebugMenuEnabled -bool true

defaults write com.apple.screensaver askForPassword -bool true
defaults write com.apple.screensaver askForPasswordDelay -int 0
defaults -currentHost write com.apple.screensaver CleanExit -bool YES
defaults -currentHost write com.apple.screensaver PrefsVersion -int 100
defaults -currentHost write com.apple.screensaver moduleDict -dict type -int 1
defaults -currentHost write com.apple.screensaver moduleDict -dict-add moduleName -string "Word of the Day"
defaults -currentHost write com.apple.screensaver moduleDict -dict-add path -string "/System/Library/Screen Savers/Word of the Day.qtz"

defaults write com.apple.QuickTimePlayerX MGFullScreenExitOnAppSwitch -int 0

defaults write com.apple.TimeMachine 'AutoBackup' -bool false

defautls write -g AppleInterfaceStyle -string 'Dark'
defaults write -g PMPrintingExpandedStateForPrint -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode -bool true
defaults write -g NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write -g WebKitDeveloperExtras -bool true
defaults write -g NSUserDictionaryReplacementItems -array \
    '{ on = 1; replace = cyl; with = "Cya later!"; }' \
    '{ on = 1; replace = ttyl; with = "Talk to you later!"; }' \
    '{ on = 1; replace = omw; with = "On my way!"; }' \
    '{ on = 1; replace = omg; with = "Oh my God!"; }'
defaults write -g AppleShowScrollBars -string "WhenScrolling"

defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

defaults write com.apple.dock mouse-over-hilite-stack -bool true
defaults write com.apple.dock 'tilesize' -int 42
defaults write com.apple.dock 'magnification' -bool false
defaults write com.apple.dock use-new-list-stack -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock mru-spaces -bool true
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari NSQuitAlwaysKeepsWindows -int 0
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
defaults write com.apple.safari WebKitDNSPrefetchingEnabled -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 '{ enabled = 1; value = { parameters = ( 65535, 49, 262144 ); type = standard; }; }'
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library
sudo chflags nohidden /Volumes

defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
defaults write NSGlobalDomain com.apple.springing.enabled -bool true
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

defaults write com.apple.screencapture location ~/Pictures/Snapshots
defaults write com.apple.screencapture type -string "png"

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

defaults write com.apple.finder ShowPathbar -bool true

defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write /Library/Preferences/com.apple.finder PathBarRootAtHome -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.Finder AppleShowAllFiles -bool true
defaults write com.apple.Finder FXPreferredViewStyle -string "nlsv"
defaults write com.apple.Finder MyDocsLibrarySavedViewStyle -string "nlsv"
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder EmptyTrashSecurely -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true/

for app in "Activity Monitor" \
	"Address Book" \
	"Calendar" \
	"cfprefsd" \
	"Contacts" \
	"Dock" \
	"Finder" \
	"Mail" \
	"Safari" \
	"SystemUIServer" \
	"iCal"
do
	killall "${app}" &> /dev/null
done

sudo softwareupdate --schedule ON


