#!/bin/bash
echo Checking if plex is running...
#if /usr/syno/bin/synopkg is_onoff "Plex Media Server" > /dev/null
if echo > /dev/tcp/127.0.0.1/32400 > /dev/null
then
 echo Plex is running.
 exit 0
else
 echo Plex is not running.  Will attempt to start it.
 echo
 echo --------------------Last 20 log entries--------------------
 tail -20 /volume1/libraries/config/plex/Library/Application\ Support/Plex\ Media\ Server/Logs/Plex\ Media\ Server.log # Modify this path to point to your Plex Media Server.log
echo --------------------End of log--------------------
 echo
 cd /volume1/docker # Modify this path to point to your docker-compose.yml directory
 docker-compose stop plex
 sleep 60
 docker-compose start plex
 exit 1
fi
