#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Open business apps
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🏢

# Documentation:
# @raycast.author Cem Ozturk

#!/bin/bash

appList=("Zen Browser" "Microsoft Teams" "Slack" "Xcode-16.0.0" "Sublime Merge")

for appName in "${appList[@]}"
do
    appIsRunning=false
    
    if pgrep -x "$appName" > /dev/null
    then
        appIsRunning=true
    fi
    
    if [ "$appIsRunning" = false ]
    then
        open -a "$appName"
    fi
done

