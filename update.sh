#!/bin/bash

echo "╭────────────────────────────╮"
echo "│    ⚙️ Created by Aditya    │"
echo "╰────────────────────────────╯"

if [ "$(id -u)" -eq 0 ]; then
    if ping -c 1 -W 1 8.8.8.8 > /dev/null 2>&1; then
        echo "🌐 Internet connection detected."
        echo "🔄 Updating your system..."

        apt update && apt full-upgrade -y -o APT::Get::Always-Include-Phased-Updates=true

        if [ $? -eq 0 ]; then
            echo "✅ System successfully updated!"
        else
            echo "❌ Something went wrong during the update."
        fi
    else
        echo "❌ No internet connection. Check your network."
    fi
else
    echo "🚫 You are not the root user. Please run with sudo."
fi
