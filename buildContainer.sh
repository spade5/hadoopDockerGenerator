#!/bin/bash

# node nums, default 3
N=3

echo $1
if (( $1 )); then
    N=$1
fi

# build hadoop image
docker rmi -f hadoop
docker build -t 'hadoop' .

# create bridge
docker network rm -f hadoop
docker network create hadoop

# run master
docker run --name hadoop0 --privileged=true --network hadoop --hostname hadoop0 -d -P -p 9870:9870 -p 8088:8088 hadoop

# run slave containers
for (( i=1; i<N; i++))
do
    name=hadoop${i}
    echo "run ${name}"
    docker run --name ${name} --privileged=true --network hadoop --hostname ${name} -d -P hadoop
done

# init containers
for (( i=0; i<N; i++))
do
    name=hadoop${i}
    echo "init ${name}"
    docker exec $name /bin/bash -c ". /scripts/init.sh"
done

# start hadoop
docker exec -it hadoop0 /bin/bash  
cd /usr/local/hadoop-3.3.4
bin/hdfs namenode -format
bin/hdfs dfs -mkdir /user
bin/hdfs dfs -mkdir /user/root
sbin/start-dfs.sh
sbin/start-yarn.sh
