#!/bin/bash

echo -n "Would you like to keep the current crontab tasks (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
    sudo bash /home/vagrant/cronjob.sh
else
    sudo rm /var/spool/cron/crontabs/root
    sudo touch /var/spool/cron/crontabs/root
    sudo chmod 600 /var/spool/cron/crontabs/root
    sudo bash /home/vagrant/cronjob.sh
fi


