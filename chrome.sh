#!/bin/bash

# run chrome in security disabled mode.

# Define the Chrome executable path and the command to launch Chrome with flags
chrome_path="/usr/bin/google-chrome-stable"
chrome_flags="--disable-web-security --user-data-dir=/tmp/"

# Check if Chrome is already running and kill all Chrome processes
if pgrep -x "chrome" > /dev/null
then
    killall chrome
fi

# Launch Chrome with the flags
nohup "$chrome_path" $chrome_flags >/dev/null 2>&1 &
