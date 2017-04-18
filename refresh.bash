#!/bin/bash

confdir="$(dirname $(readlink -f "$0"))"
logfolder="$confdir/log"
ids=$(cat $confdir/ids.config)
for id in $ids;
do 
	if [ ! -f $logfolder/$id.txt ]; then
  		touch "$logfolder/$id.txt"
	fi

	wget http://osu.ppy.sh/u/$id -P /tmp/
	
	now=$(cat /tmp/$id | grep timeago | grep "Last Active" | grep -o '20[0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-6][0-9]:[0-6][0-9]Z')
	recent=$(tail -1 $logfolder/$id.txt)
	echo $now
	writer=$(date --iso-8601=minutes --date $now | sed 's/+.*//' | sed 's/T/\ /' ) 
	echo $recent
	if [[ "$writer" != "$recent" ]]; then
	
		echo $writer >> "$logfolder/$id.txt"
	fi
	rm /tmp/$id*
done
