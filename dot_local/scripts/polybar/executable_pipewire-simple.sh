#!/bin/sh

# Taken from: https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/pipewire-simple

getDefaultSink() {
    defaultSink=$(pactl info | awk -F : '/Default Sink:/{print $2}')
    description=$(pactl list sinks | sed -n "/${defaultSink}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description}"
}

getDefaultSource() {
    defaultSource=$(pactl info | awk -F : '/Default Source:/{print $2}')
    description=$(pactl list sources | sed -n "/${defaultSource}/,/Description/s/^\s*Description: \(.*\)/\1/p")
    echo "${description}"
}

VOLUME=$(pamixer --get-volume-human)
SINK=$(getDefaultSink)
SOURCE=$(getDefaultSource)

if [ "$VOLUME" = "muted" ]; then
  ICON="ﱝ"
else
  ICON=""
fi

case $1 in
    "--up")
        pamixer --increase 5
        ;;
    "--down")
        pamixer --decrease 5
        ;;
    "--mute")
        pamixer --toggle-mute
        ;;
    *)
        echo "${ICON} ${VOLUME}"
esac

