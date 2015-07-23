#!/bin/bash

#vars
cdh1="CDH5"

##functions

function add_cluster
{
  curl -X POST -u "$login" -i \
    -H "content-type:application/json" \
    -d '{ "items": [
          {
            "name": "test2",
            "version": "'$cdh1'"
          }
      ] }'  \
    http://172.30.65.24:7180/api/v9/clusters
}


function stop_cluster
{

  curl -X POST -u "$login" -i \
    -H "content-type:application/json" \
    -d '{ "items": [
          {
            "name": "'$cname'",
            "version": "'$cdh1'"
          }
      ] }'  \
    http://$cip:7180/api/v9/clusters/Cluster%201/commands/stop

}

function start_cluster
{
  curl -X POST -u "$login" -i \
    -H "content-type:application/json" \
    -d '{ "items": [
          {
            "name": "'$cname'",
            "version": "'$cdh1'"
          }
      ] }'  \
    http://$cip:7180/api/v9/clusters/$cname/commands/start

}

function stop_cm
{

  curl -X POST -u "$login" -i \
    -H "content-type:application/json" \
    -d '{ "items": [
          {
            "version": "'$cdh1'"
          }
      ] }'  \
    http://$cip:7180/api/v9/cm/service/commands/stop

}
