#!/system/bin/sh

## This is so fucking ghetto...
# Andy R & Magisk 23.0 are so borked...
# We do this because processes can no longer fork off magisk context.
# This means if our sys scripts need to execute more scripts, tough shit.
# Only service.d allows this now appearently...

## INITIATE BLOOD SWEAT AND TEARS!!!
# Allowing us to drop static scripts into rom, again

until [ -d /data/adb/service.d ]; do
	sleep 0.5
done

#if [ ! -e /data/adb/magisk/magiskinit ]; then
#	/system/xbin/tar xpvzf/system/etc/restore/setup.tar.gz -C /data/adb
#fi

if [ ! -e /data/adb/service.d/sysinit.sh ]; then
	echo "#!/system/bin/sh" > /data/adb/service.d/sysinit.sh
	echo "/system/xbin/sysinit" >> /data/adb/service.d/sysinit.sh
	echo "" >> /data/adb/service.d/sysinit.sh
	sleep 0.5
	chmod 550 /data/adb/service.d/sysinit.sh
fi

if [ -e /data/adb/service.d/sysinit.sh ] && [ ! -x /data/adb/service.d/sysinit.sh ]; then
	sleep 0.5
	chmod 550 /data/adb/service.d/sysinit.sh
fi

if [ ! -e /data/adb/service.d/0000liveboot ]; then
	echo "#!/system/bin/sh" > /data/adb/service.d/0000liveboot
	echo "exec /system/xbin/liveboot" >> /data/adb/service.d/0000liveboot
	echo "" >> /data/adb/service.d/0000liveboot
	sleep 0.5
	chmod 550 /data/adb/service.d/0000liveboot
fi

