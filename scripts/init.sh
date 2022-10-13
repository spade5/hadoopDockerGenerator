#!/bin/bash

# hosts
# cat /scripts/hosts >> /etc/hosts

if [[ -d "/scripts/confbak/" ]]; then
    echo "hadoop is inited!"
else
    echo "HADOOP_HOME:"
    HADOOP_HOME=/usr/local/hadoop-3.3.4
    echo $HADOOP_HOME
    echo "export JAVA_HOME=/usr/local/jdk11" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh

    mkdir /scripts/confbak
    cp /scripts/conf/* /scripts/confbak/

    mv -f /scripts/conf/core-site.xml $HADOOP_HOME/etc/hadoop/core-site.xml
    mv -f /scripts/conf/hdfs-site.xml $HADOOP_HOME/etc/hadoop/hdfs-site.xml
    mv -f /scripts/conf/mapred-site.xml $HADOOP_HOME/etc/hadoop/mapred-site.xml
    mv -f /scripts/conf/yarn-site.xml $HADOOP_HOME/etc/hadoop/yarn-site.xml
    mv -f /scripts/conf/workers $HADOOP_HOME/etc/hadoop/workers
fi


# scp -r $HADOOP_HOME/etc/hadoop/ hadoop1:$HADOOP_HOME/etc/hadoop/
# scp -r $HADOOP_HOME/etc/hadoop/ hadoop2:$HADOOP_HOME/etc/hadoop/

# scp ~/.ssh/known_hosts hadoop1:~/.ssh/known_hosts
# scp ~/.ssh/known_hosts hadoop1:~/.ssh/known_hosts

# mv -f /scripts/known_hosts ~/.ssh/known_hosts

