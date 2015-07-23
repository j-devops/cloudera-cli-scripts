#!/bin/bash

source vars.sh

url="http://$cip:7180/api/v9/clusters/$cname"

curl -u $login "$url/services" #| egrep 'name|summary|serviceS|healthSummary'

