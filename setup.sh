#/bin/sh
echo -n "Please specify the users you want to track with their id. The name will work most of the time too but may lead to bugs.\n-->"
read users
echo $users >> $(dirname $(readlink -f "$0"))/ids.config
mkdir -p log 
