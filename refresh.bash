#!/bin/bash

confdir="$(dirname $(readlink -f "$0"))" # Sets the current script dir as confdir
logfolder="$confdir/log" # sets the logfolder as a subfolder of the confdir
ids=$(cat $confdir/ids.config) # read the id's from file
for id in $ids; # repeat for every id
do 
	if [ ! -f $logfolder/$id.txt ]; then #create the userfile if it does not exist
  		touch "$logfolder/$id.txt"
	fi

	wget http://osu.ppy.sh/u/$id -P /tmp/ # download the website to /tmp
	
	now=$(cat /tmp/$id | grep timeago | grep "Last Active" | grep -o '20[0-9][0-9]-[0-1][0-9]-[0-3][0-9]T[0-2][0-9]:[0-6][0-9]:[0-6][0-9]Z')
	recent=$(tail -1 $logfolder/$id.txt)
	echo $now
	writer=$(date --iso-8601=minutes --date $now | sed 's/+.*//' | sed 's/T/\ /' ) # filter out the date and compare it to the last entry
	echo $recent
	if [[ "$writer" != "$recent" ]]; then
	
		echo $writer >> "$logfolder/$id.txt" # add the entry if it is different than the last one
	fi
	rm /tmp/$id* # remove the website 
done
