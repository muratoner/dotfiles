#!/bin/bash

# Dock'u sıfırla (tüm simgeleri kaldır)
defaults write com.apple.dock persistent-apps -array

# Sistem uygulamaları
sys_apps=(
    "/System/Applications/Launchpad.app"
    "/System/Applications/Utilities/Terminal.app"
)

# Harici uygulamalar (Applications yolunda olanlar)
apps=(
    "Zen Browser"
    "Obsidian"
    "Sublime Merge"
    "Bitwarden"
    "Microsoft Teams"
    "Slack"
)

# Sistem uygulamaları ekle
for app in "${sys_apps[@]}"; do
    if [ -d "$app" ]; then
        defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
    fi
done

# Harici uygulamaları /Applications yolundan ekle
for app in "${apps[@]}"; do
    app_path="/Applications/$app.app"
    if [ -d "$app_path" ]; then
        defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app_path</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
    fi
done

# Dock'u yeniden başlat
killall Dock
