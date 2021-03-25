#!/bin/bash

apt-get update
apt-get install -y postgresql postgresql-contrib

sudo -u postgres psql -c "DROP ROLE IF EXISTS root"
sudo -u postgres psql -c "CREATE ROLE root SUPERUSER LOGIN PASSWORD 'root'"

echo "host    all             all             0.0.0.0/0            md5" >> /etc/postgresql/10/main/pg_hba.conf

echo "listen_addresses = '*'" >> /etc/postgresql/10/main/postgresql.conf

sudo -u postgres dropdb chinook
sudo -u postgres createdb chinook
sudo -u postgres psql -d chinook -f /tmp/chinook_data.sql

systemctl restart postgresql

mkdir database_backup auto_update
cd database_backup

sudo yes | cp -rf /vagrant/dbbackup.sh ./

cd ../auto_update

sudo yes | cp -rf /vagrant/autoupdate.sh ./

cd ../

sudo yes | cp -rf /vagrant/cronjob.sh ./

sudo chown -R vagrant:vagrant ./database_backup
sudo chown -R vagrant:vagrant ./auto_update

sudo cp -rf /vagrant/root /var/spool/cron/crontabs/
sudo chmod 600 /var/spool/cron/crontabs/root

sudo bash cronjob.sh


