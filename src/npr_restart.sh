#!/bin/sh

#
# Small helper script to restart npresence. Usable under Linux and OpenWRT
#

imyip=`ip a|awk /$(ip r|awk '/default/ { print $5 }')/|awk '/inet/ { print $2 }'| cut -f1 -d"/"`

if [[ $imyip =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
	echo Got IP: $imyip
else
	echo FATAL ERROR
	echo IP not available
	exit 1
fi

if [ -e /etc/opkg.conf ]; then
	# OpenWRT
	echo Check OpenWRT
	pid=`ps | grep hci | awk '/[n]presenced/{print $1}'`
	echo Got PID: $pid
	if [ ! -z $pid ]; then
		echo "Kill PID: $pid"
		kill $pid
	fi

	echo Starting npresenced for $myip
	/overlay/npresenced/npresenced -b hci0 -a $myip -p 5333 -l LOG_ERR -t stdout --fast &
else
	echo Check Linux
	pid=`ps -ef | awk '/[n]presenced/{print $2}'`
	if [ ! -z $pid ]; then
		echo "Kill PID: $pid"
		kill $pid
	fi

	echo Starting npresenced for $myip
	/usr/local/bin/npresenced -b hci0 -a $myip -p 5333 -l LOG_ERR -t stdout --fast &
fi

