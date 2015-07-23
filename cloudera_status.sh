#!/bin/bash

source vars.sh

url="http://$ip:7180/api/v9/clusters/$clustername/"

curl -u $login "$url services" #| egrep 'name|summary|serviceS|healthSummary'

