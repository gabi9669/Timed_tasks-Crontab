# Timed tasks with Crontab

By default there are two timed tasks in this project. One to make an update and upgrade every once a week, and an another to make backup from Postgres databases twice a day.

With the `new_cronjob.sh` file you can modify the existing crontab file or you can remove and add a new only with the new commands that you have written into the `mk_cronjob` file(basically the same as `crontab -e` command, only it makes the root crontab). If you write something into the file before `vagrant up`, those commands will run from the start.

In the database backup script file, there is a commented row, with it, you can create a backup from one database, if you add it's name, otherwise by default it saves all databases in psql.

**Base requirements:**

 - git (https://git-scm.com/downloads)
 - Vagrant (https://www.vagrantup.com/downloads)
 - Virtualbox (https://www.virtualbox.org/wiki/Downloads)
 - Database sample - https://github.com/lerocha/chinook-database/tree/master/ChinookDatabase/DataSources