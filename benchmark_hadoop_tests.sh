#!/bin/bash

source vars.sh

#quick test
echo
echo "Quick hdfs validation"
out=`sudo -u hdfs hadoop jar $hpath/hadoop-examples.jar pi 10 100 > /tmp/hd.out 2>&1`
cat /tmp/hd.out | tail -9


#test hadoop writes
echo
echo "Testing Write hdfs"
out=`sudo -u hdfs hadoop jar $hpath/hadoop-test.jar TestDFSIO -write -nrFiles 10 -fileSize 100 > /tmp/hd.out 2>&1`
cat /tmp/hd.out | tail -9


#test hadoop reads
echo
echo "Testing Read hdfs"
out=`sudo -u hdfs hadoop jar $hapth/hadoop-test.jar TestDFSIO -read -nrFiles 10 -fileSize 100 > /tmp/hd.out 2>&1`
cat /tmp/hd.out | tail -9

#teragen BM

echo
echo "Testing Read hdfs"
sudo -u  hdfs hadoop fs -rmdir --ignore-fail-on-non-empty  /test/
out=`sudo -u hdfs hadoop jar hapth/hadoop-mapreduce-examples.jar teragen -D dfs.block.size=536870912 100000000 /test/terasort-file > /tmp/hd.out 2>&1`
cat /tmp/hd.out | tail -9
