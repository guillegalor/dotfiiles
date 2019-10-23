#!/bin/env bash

# Original source - https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/openweathermap-detailed

get_icon() {
    case $1 in
        01d) ICON="";;
        01n) ICON="";;
        #02d) ICON="";; # This was commented because of below icon
        #02n) ICON="";; # This icon not working correctly
        02d) ICON="";;
        02n) ICON="";;
        03*) ICON="";;
        04*) ICON="";;
        09*) ICON="";;
        10d) ICON="";;
        10n) ICON="";;
        11*) ICON="";;
        13*) ICON="";;
        50*) ICON="";;
        *) ICON="";
    esac

    echo $ICON
}

# Global settings
KEY="114f7e4a613d81083da8803fb16caa43"
# CITY_ID="6359420" # Antequera
CITY_ID="6357709" # Granada
UNITS="metric"
SYMBOL="°C"
API="https://api.openweathermap.org/data/2.5"

# Get weather
WEATHER=$(curl -sf "$API/weather?APPID=$KEY&id=$CITY_ID&units=$UNITS")

# Get condition, temp and icon
WEATHER_MAIN=$(echo $WEATHER | jq -r ".weather[0].main")
WEATHER_ICON=$(echo $WEATHER | jq -r ".weather[0].icon")
WEATHER_TEMP=$(echo $WEATHER | jq -r ".main.temp")

# Print weather
echo "$(get_icon $WEATHER_ICON) $WEATHER_MAIN $WEATHER_TEMP$SYMBOL"
