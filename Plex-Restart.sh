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
 tail -20 /volume1/PlexMediaServer/AppData/Plex\ Media\ Server/Logs/Plex\ Media\ Server.log
echo --------------------End of log--------------------
 echo
 /usr/syno/bin/synopkg stop "Plex Media Server"
 sleep 60
 /usr/syno/bin/synopkg start "Plex Media Server"
 exit 1
fi
