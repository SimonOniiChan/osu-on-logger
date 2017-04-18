# osu-on-logger
Logs the login times of an user on osu.ppy.sh

## INSTALLING
Download the repository first with `git clone https://github.com/gamescom15/osu-on-logger`

Run the `setup.sh` to create the log folder and input the users you want to track.

Run the `run-as-root.bash` to create a cronjob in /etc/crontab. Please note that the job runs as root, so you might want to adjust that, as i was too lazy to find a way to use the name of the currently logged in user in the shell below the root shell.

## USAGE
the script should now run every 15 minutes and update the timestamps in the log folder. Make sure to have your date set correctly beforehand

## SIDE NOTES
You can safely delete the `run-as-root.bash` as well as the `setup.sh`. However, setup.sh can later be used to add users to the track list without editing the config file, so you might want to keep it.
