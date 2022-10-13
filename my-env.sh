#!/bin/bash

export JAVA_HOME=/usr/local/jdk11
export HADOOP_HOME=/usr/local/hadoop-3.3.4
export PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$PATH

export HDFS_NAMENODE_USER=root
export HDFS_DATANODE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root
export YARN_NODEMANAGER_USER=root
export YARN_RESOURCEMANAGER_USER=root

. /scripts/init.sh