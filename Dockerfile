FROM centos:7.9.2009

# 安装openssh-server和sudo软件包，并且将sshd的UsePAM参数设置成no  
RUN yum install -y openssh-server sudo
RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config
#安装openssh-clients
RUN yum  install -y openssh-clients

RUN yum install -y which

#安装 scala
RUN yum install scala

# 添加测试用户root，密码root，并且将此用户添加到sudoers里  
RUN echo "root:root" | chpasswd
RUN echo "root   ALL=(ALL)       ALL" >> /etc/sudoers
# 启动sshd服务并且暴露22端口  
RUN ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key
RUN mkdir /var/run/sshd
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]

#初始化 ssh key
RUN ssh-keygen -t rsa -f ~/.ssh/id_rsa -P '' && \
    cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

#拷贝并解压jdk
ADD jdk-11.tar.gz /usr/local/
RUN mv /usr/local/jdk-11.0.16.1 /usr/local/jdk11

#拷贝并解压 hadoop
ADD hadoop-3.3.4.tar.gz /usr/local

#拷贝并解压 spark
ADD spark-3.3.0-bin-hadoop3.tgz /usr/local

#拷贝并解压 spark
#TODO

RUN mkdir /scripts
COPY scripts /scripts/
COPY my-env.sh /etc/profile.d/
RUN chmod 777 /scripts/init.sh