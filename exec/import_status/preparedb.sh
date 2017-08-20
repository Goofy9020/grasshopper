#!/bin/bash
/var/www/html/exec/monitor/SendCommand.py '*#1*0##' >/var/www/html/exec/import_status/lightstatus.txt
sed -i 's/*/,/g' /var/www/html/exec/import_status/lightstatus.txt
sed -i 's/^,//g' /var/www/html/exec/import_status/lightstatus.txt
sed -i 's/##//g' /var/www/html/exec/import_status/lightstatus.txt
mysql --local-infile=1 -u root --database=domotica --verbose </var/www/html/exec/import_status/lightstatus.sql
