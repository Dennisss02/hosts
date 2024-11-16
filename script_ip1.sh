#!/bin/bash

cat /etc/hosts | while read linie || [[ -n "$linie" ]]; do
	read ip_hosts nume plus <<< $linie
	L=`nslookup $nume | grep 'Address: ' | head -n 1`
	ip=${L##* }
	if [ "$ip_hosts" != "$ip" ]; then
		echo "Bogus ip for $nume in /etc/hosts, ip is not $ip_hosts, it is $ip"
	fi
done
