#!/bin/bash

cd $HADOOP_HOME
bin/hdfs namenode -format
sbin/start-all.sh
bin/hdfs dfs -mkdir /user
bin/hdfs dfs -mkdir /user/root

cd $SPARK_HOME
sbin/start-all.sh