#!/bin/bash

export JAVA_HOME=/usr/local/jdk11
export HADOOP_HOME=/usr/local/hadoop-3.3.4
export SPARK_HOME=/usr/local/spark-3.3.2-bin-hadoop3-scala2.13
export SCALA_HOME=/usr/local/scala
export PATH=$JAVA_HOME/bin:$HADOOP_HOME/bin:$SPARK_HOME/bin:$SCALA_HOME/bin:$PATH

export HDFS_NAMENODE_USER=root
export HDFS_DATANODE_USER=root
export HDFS_SECONDARYNAMENODE_USER=root
export YARN_NODEMANAGER_USER=root
export YARN_RESOURCEMANAGER_USER=root

. /scripts/init.sh