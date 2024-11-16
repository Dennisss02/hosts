#!/bin/bash

valid_ip()
{
     	L=$(nslookup $1 $3 | grep 'Address: ' | head -n 1)
	ip_nsl=${L##* }
        if [ "$ip_nsl" != "$2" ]; then
                echo "Ip gresit, ip-ul corect: $ip_nsl"
        else
		echo "Ip corect"
	fi
}
valid_ip $1 $2 $3
