#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Close business apps
# @raycast.mode compact

# Optional parameters:
# @raycast.icon ❎

# Documentation:
# @raycast.author Cem Ozturk

#!/bin/bash

appList=("Microsoft Teams" "Slack" "Xcode-16.0.0" "Sublime Merge")

# Activity Monitor > Sample Proccess > bundleID
appIdList=("com.apple.dt.Xcode" "com.microsoft.teams2" "com.tinyspeck.slackmacgap" "com.sublimemerge" "md.obsidian")

for appId in "${appIdList[@]}"
do
    osascript -e "quit app id \"$appId\""
done

echo "Uygulama sonlandırma işlemi tamamlandı."
