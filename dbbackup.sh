#!/bin/bash

backup_date=`date +%T-%d-%m-%Y`

su - root

pg_dump -U root chinook > /home/vagrant/database_backup/chinook_$backup_date.sql
