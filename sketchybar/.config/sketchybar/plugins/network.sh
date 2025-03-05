#!/bin/bash

WIFI_ICON=""
ETH_ICON=""
DISCONNECTED_ICON=""

# Extract Wi-Fi SSID and Signal Strength
WIFI_SSID=$(wdutil info | grep "SSID" | sed 's/SSID\s*:\s*//')
WIFI_SIGNAL=$(wdutil info | awk '/agrCtlRSSI/ {print $2}')

# Check Ethernet status
ETH_STATUS=$(ifconfig en0 | grep "status: active")

if [ -n "$WIFI_SSID" ]; then
  sketchybar --set network icon="$WIFI_ICON" label="$WIFI_SSID ($WIFI_SIGNAL dBm)"
elif [ -n "$ETH_STATUS" ]; then
  sketchybar --set network icon="$ETH_ICON" label="Ethernet Connected"
else
  sketchybar --set network icon="$DISCONNECTED_ICON" label="Disconnected"
fi