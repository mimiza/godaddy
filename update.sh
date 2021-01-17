#!/bin/bash

domain=$1
host=$2
key=$3
secret=$4

ip=`curl -s "https://api.ipify.org"`

godaddy=`curl -s -X GET -H "Authorization: sso-key ${key}:${secret}" "https://api.godaddy.com/v1/domains/${domain}/records/A/${host}" | cut -d'[' -f 2 | cut -d']' -f 1 | jq -r '.data'`

if [ "$ip" != "$godaddy" -a "$ip" != "" ]; then
	curl -s -X PUT "https://api.godaddy.com/v1/domains/${domain}/records/A/${host}" -H "Authorization: sso-key ${key}:${secret}" -H "Content-Type: application/json" -d "[{\"data\": \"${ip}\"}]"
fi
