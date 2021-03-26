#!/bin/bash

backup_date=`date +%T-%d-%m-%Y`
su - root

pg_dumpall -U root > /home/vagrant/database_backup/psql_backup_$backup_date.sql

#pg_dump -U root <DATABASE> > /home/vagrant/database_backup/<DATABASE>_$backup_date.sql
