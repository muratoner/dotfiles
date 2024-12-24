#!/usr/bin/env zsh

xcode-select --install

echo "Complete the installation of Xcode Command Line Tools before proceeding."
echo "Press enter to continue..."
read

# https://macos-defaults.com/
# -- Dock Defaults --

# Set the position of the Dock on the screen.
# Alternatives are "right" (right side) or "bottom" (default bottom position).
# https://macos-defaults.com/dock/orientation.html
defaults write com.apple.dock "orientation" -string "left" && killall Dock

# Set the Dock tile size to 75 pixels and restart the Dock to apply changes.
# https://macos-defaults.com/dock/tilesize.html
defaults write com.apple.dock "tilesize" -int "75" && killall Dock

# Don't show recently used apps in a separate section of the Dock.
# https://macos-defaults.com/dock/show-recents.html
defaults write com.apple.dock "show-recents" -bool "false" && killall Dock

## Add Persistent Apps to Dock
./add-dock-items.sh

## Add Chromium browser as a default web browser. (Currently im using Zen Browser which is based on firefox)
# open -a "Google Chrome" --args --make-default-browser

# -- Finder Defaults --

# Show hidden files in the Finder. You can toggle the value using ⌘ + ⇧ + .
# https://macos-defaults.com/finder/appleshowallfiles.html
defaults write com.apple.finder "AppleShowAllFiles" -bool "true" && killall Finder

# Set the default view style for folders without custom setting
# https://macos-defaults.com/finder/fxpreferredviewstyle.html
defaults write com.apple.finder "FXPreferredViewStyle" -string "icnv" && killall Finder

# Choose whether to display a warning when changing a file extension.
# Do not display the warning
# https://macos-defaults.com/finder/fxenableextensionchangewarning.html
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false" && killall Finder

# Choose the size of Finder sidebar icons
# https://macos-defaults.com/finder/nstableviewdefaultsizemode.html
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "3" && killall Finder

# -- Mouse Defaults --

# Set scroll as traditional instead of natural
# https://macos-defaults.com/mouse/linear.html
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false && killall Finder

# -- Keyboard Defaults --

# Allows you to select the behavior when a key is held down for a long time. The two possible behaviors are:
#   show character accents menu (default)
#   repeat character while key held

# ⚠️ Restarting the Mac, closing the session or restarting the application is necessary to take into effect the changes.
# https://macos-defaults.com/keyboard/applepressandholdenabled.html
defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

# -- Mission Control Defaults --

# If you have several windows from multiple apps open simultaneously, have the windows organised by app in Mission Control.
# Do not group windows by application.
# https://macos-defaults.com/mission-control/expose-group-apps.html
defaults write com.apple.dock "expose-group-apps" -bool "true" && killall Dock

# -- Xcode Defaults --
# Show build durations in the Activity Viewer in Xcode's toolbar at the top of the workspace window.
# https://macos-defaults.com/xcode/showbuildoperationduration.html
defaults write com.apple.dt.Xcode "ShowBuildOperationDuration" -bool "true" && killall Xcode

# -- ScreenShot Defaults --

# Set location for screenshots
# https://macos-defaults.com/screenshots/
mkdir "${HOME}/Desktop/Screenshots"
defaults write com.apple.screencapture location "${HOME}/Desktop/Screenshots" && killall SystemUIServer

# -- TextEdit Defaults --

# Set default document format as rich text (.rtf) or plain text (.txt).
# Rich text is disabled. TXT is enabled.
defaults write com.apple.TextEdit "RichText" -bool "false" && killall TextEdit

# -- Menu Bar Defaults --

# Add Bluetooth to Menu Bar for battery percentages
defaults write com.apple.controlcenter "NSStatusItem Visible Bluetooth" -bool true && killall ControlCenter

# Get the absolute path to the image
IMAGE_PATH="${HOME}/dotfiles/settings/DesktopWallpaper.jpg"

# AppleScript command to set the desktop background
osascript <<EOF
tell application "System Events"
    set desktopCount to count of desktops
    repeat with desktopNumber from 1 to desktopCount
        tell desktop desktopNumber
            set picture to "$IMAGE_PATH"
        end tell
    end repeat
end tell
EOF
