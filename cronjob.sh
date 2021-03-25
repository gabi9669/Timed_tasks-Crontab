rm jobs.txt

crontab -l > jobs.txt #Dump the existing cron jobs to a file

echo "0 12 * * * /home/vagrant/database_backup/dbbackup.sh >> /home/vagrant/database_backup/bckp.log 2>&1" >> jobs.txt
echo "0 0 * * 7 /home/vagrant/auto_update/autoupdate.sh >> /home/vagrant/auto_update/updt.log 2>&1" >> jobs.txt

crontab jobs.txt
