#!/bin/bash

# hosts
# cat /scripts/hosts >> /etc/hosts

if [[ -d "/scripts/confbak/" ]]; then
    echo "hadoop is inited!"
else
    echo "HADOOP_HOME:"
    HADOOP_HOME=/usr/local/hadoop-3.3.4
    SPARK_HOME=/usr/local/spark-3.3.2-bin-hadoop3-scala2.13
    echo $HADOOP_HOME
    echo "export JAVA_HOME=/usr/local/jdk11" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh
    cp $SPARK_HOME/conf/spark-env.sh.template $SPARK_HOME/conf/spark-env.sh
    echo "export JAVA_HOME=/usr/local/jdk11" >> $SPARK_HOME/conf/spark-env.sh
    echo "export SPARK_WORKER_CORES=1" >> $SPARK_HOME/conf/spark-env.sh

    mkdir /scripts/confbak
    cp /scripts/conf/* /scripts/confbak/

    mv -f /scripts/conf/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
    mv -f /scripts/conf/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
    mv -f /scripts/conf/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
    mv -f /scripts/conf/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
    cp /scripts/conf/workers $SPARK_HOME/conf/workers
    mv -f /scripts/conf/workers $HADOOP_HOME/etc/hadoop/workers
fi


# scp -r $HADOOP_HOME/etc/hadoop/ hadoop1:$HADOOP_HOME/etc/hadoop/
# scp -r $HADOOP_HOME/etc/hadoop/ hadoop2:$HADOOP_HOME/etc/hadoop/

# scp ~/.ssh/known_hosts hadoop1:~/.ssh/known_hosts
# scp ~/.ssh/known_hosts hadoop1:~/.ssh/known_hosts

# mv -f /scripts/known_hosts ~/.ssh/known_hosts

