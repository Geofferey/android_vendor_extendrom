#!/system/bin/sh
## INITIATE BLOOD SWEAT AND TEARS!!!
# Allowing us to drop static scripts into rom, again

until [ -d /data/adb ]; do
	sleep 0.1
done

sleep 1

if [ ! -e /data/adb/magisk/magiskinit ]; then
	/system/bin/setprop persist.magisk.installed 0
	until [ -e /data/adb/magisk/magiskinit ]; do
	sleep 0.5
	done
	sleep 1
	/system/bin/setprop sys.powerctl reboot
fi

if [ -e /data/adb/magisk/magiskinit ]; then
	/system/bin/setprop persist.magisk.installed 1
fi
