#!/bin/bash

# Downloaded from: https://github.com/polybar/polybar-scripts/tree/master/polybar-scripts/system-bluetooth-bluetoothctl


bluetooth_print() {
    bluetoothctl | while read -r; do

      if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
        # Modified here to use hcitool to tell bluetooth is actually powered ON or not
        if [ ! -z "$(/usr/bin/bluetoothctl show | grep 'Powered: yes')" ]; then
          counter=0
          devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)

          echo "$devices_paired" | while read -r line; do
              device_info=$(bluetoothctl info "$line")

              if echo "$device_info" | grep -q "Connected: yes"; then
                  device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

                  if [ $counter -gt 0 ]; then
                      printf ", %s" "$device_alias"
                  else
                      printf " %s" "$device_alias"
                  fi

                  counter=$((counter+1))
              fi
          done

          if [ $counter -eq 0 ]
          then
            printf 'ON'
          fi

          printf '\n'
        else
            echo "OFF"
        fi
      fi
    done
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        sleep 2
    else
        bluetoothctl power off >> /dev/null
        sleep 2
    fi
}

case "$1" in
    --toggle)
        bluetooth_toggle
        ;;
    *)
        bluetooth_print
        ;;
esac
