#/bin/bash

echo trying to add cronjob...
if [ "$EUID" -ne 0 ] # Check if running as root
  then echo "Please run as root, as it it required for adding global cronjobs"
  exit
fi
echo "*/15 *	* * *	root	bash $(dirname $(readlink -f "$0"))/refresh.bash" >> /etc/crontab # add the crontab entry (adjust the root to your username if you feel the need to)
chmod +x $(dirname $(readlink -f "$0"))/refresh.bash # allow cron to execute the script 
