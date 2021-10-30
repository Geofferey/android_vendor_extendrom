#!/system/bin/sh
## INITIATE BLOOD SWEAT AND TEARS!!!
# Magisk 23.0 su survival, never go without su
# To ensure rom scripts always execute

export PATH=/system/xbin:/system/bin

until [ $(/system/bin/getprop init.svc.bootanim) = running ]; do

    sleep 1

done

until [ -e /data/adb ]; do

    sleep 1

done

if [ ! -e /system/etc/restore/setup.tar.gz ]; then

    exit 0

fi

sleep 2

if [ -e /data/adb/magisk/magiskinit ]; then

	/system/bin/setprop persist.magisk.installed 1

elif [ ! -e /data/adb/magisk/magiskinit ]; then

	/system/bin/blank_screen &

	until [ $(/system/bin/getprop service.bootanim.exit) = 1 ] && [ $(/system/bin/getprop sys.bootstat.first_boot_completed) = 1 ]; do

	    sleep 0

	done

	/system/bin/blank_screen &

	/system/bin/setprop persist.magisk.installed 0

	sleep 1

	until [ -e /data/adb/magisk/magiskinit ] && [ -e /data/adb/magisk/magiskboot ] && [ -e /data/adb/magisk/magisk64 ] && [ -e /data/adb/magisk/magisk32 ]  && [ -e /data/adb/magisk/busybox ] && [ -e /data/adb/magisk/boot_patch.sh ] && [ -e /data/adb/magisk/addon.d.sh ]; do

	    sleep 0

	done

	/system/bin/setprop persist.magisk.installed 1

	/system/bin/setprop sys.powerctl reboot

fi

