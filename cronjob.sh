crontab -l -u root > jobs.txt #Dump the existing cron jobs to a file

while read -r jobs
do
  echo  "$jobs" >> jobs.txt
done < mk_cronjob

crontab jobs.txt

sudo rm -rf ./jobs.txt

rm ./mk_cronjob

sudo touch ./mk_cronjob

sudo chmod 666 mk_cronjob
