#!/bin/bash

# Generates a basic Grafana config if needed


# Check if we should do the initial setup
[[ -f "/var/lib/grafana/please_do_initial_setup" ]] || exit 0

# Wait for grafana to be up
faillimit=20
echo -n "Waiting for grafana startup"
while [[ $(wget -O- -q localhost:3000 | grep -ci grafana) == 0 && $faillimit > 0 ]]; do
	((faillimit--))
	echo -n "."
	sleep 5
done

# print wait status
[[ $faillimit == 0 ]] && echo " - Max fails reached while waiting for Grafana startup!" || echo " - ok"

# Wait for grafana to be up (to be fixed with something more robust)
#sleep 3

#echo "test 2"
#wget -O- -q localhost:3000 | grep -ci grafana

# Create "collectd" data_source
sqlite3 /var/lib/grafana/grafana.db 'insert into data_source (org_id, version, type, name, access, url, password, user, database, basic_auth, is_default, created, updated) values ("1", "0", "influxdb", "collectd", "proxy", "http://'"$INFLUXDB_PORT_8086_TCP_ADDR:$INFLUXDB_PORT_8086_TCP_PORT"'", "root", "root", "collectd", "0", "1", date("now"), date("now") )' || echo "error, return code $?"

# Don't run next time
rm /var/lib/grafana/please_do_initial_setup

echo "$(date) - init successfull"
