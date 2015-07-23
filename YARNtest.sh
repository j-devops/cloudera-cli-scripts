#!/bin/sh

#Settings
# Using cores=2 memory=7GB disks=1 hbase=False
# Profile: cores=2 memory=6144MB reserved=1GB usableMem=6GB disks=1
# Num Container=3
# Container Ram=2048MB
# Used Ram=6GB
# Unused Ram=1GB
# yarn.scheduler.minimum-allocation-mb=2048
# yarn.scheduler.maximum-allocation-mb=6144
# yarn.nodemanager.resource.memory-mb=6144
# mapreduce.map.memory.mb=2048
# mapreduce.map.java.opts=-Xmx1638m
# mapreduce.reduce.memory.mb=4096
# mapreduce.reduce.java.opts=-Xmx3276m
# yarn.app.mapreduce.am.resource.mb=4096
# yarn.app.mapreduce.am.command-opts=-Xmx3276m
# mapreduce.task.io.sort.mb=819

#vars
i=2 	# 4 or 8 amount of jobs
j=2 	# 4 or 8 amount of reducers
k=2048 	#512 or 1024

# Verify this path corresponds to your installation
HADOOP_PATH=/opt/cloudera/parcels/CDH/lib/hadoop-0.20-mapreduce
# JVM heap for mappers
MAP_MB=1638
# JVM heap for reducers
RED_MB=3276
reduce=2048
map=2048


hadoop fs -rmr -skipTrash /results/*

time hadoop jar $HADOOP_PATH/hadoop-examples.jar teragen -Dmapreduce.job.maps=$i -Dmapreduce.map.memory.mb=$map -Dmapreduce.map.java.opts.max.heap=$MAP_MB 100000000 /results/tg-10GB-${i}-${j}-${k}                       



time hadoop jar $HADOOP_PATH/hadoop-examples.jar terasort -Dmapreduce.job.maps=$i -Dmapreduce.job.reduces=$j -Dmapreduce.map.memory.mb=$map -Dmapreduce.map.java.opts.max.heap=$MAP_MB -Dmapreduce.reduce.memory.mb=$reduce -Dmapreduce.reduce.java.opts.max.heap=$RED_MB /results/tg-10GB-${i}-${j}-${k} /results/ts-10GB-${i}-${j}-${k}

exit

#cleanup
hadoop fs -rmr -skipTrash /results/tg-10GB-${i}-${j}-${k}                         
hadoop fs -rmr -skipTrash /results/ts-10GB-${i}-${j}-${k}                 
