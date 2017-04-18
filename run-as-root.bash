#/bin/bash

echo trying to add cronjob...
if [ "$EUID" -ne 0 ]
  then echo "Please run as root, as it it required for adding global cronjobs"
  exit
fi
echo "*/10 *	* * *	root	sh $(dirname $(readlink -f "$0"))/refresh.bash" >> /etc/crontab
