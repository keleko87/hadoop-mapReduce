FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV SQOOP_VERSION=1.4.7
# Misma versión que el clúster bde2020 (namenode/resourcemanager/nodemanager)
ENV HADOOP_VERSION=3.2.1
ENV HADOOP_HOME=/usr/local/hadoop
ENV SQOOP_HOME=/usr/local/sqoop
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin:$SQOOP_HOME/bin

RUN apt-get update && apt-get install -y \
    openjdk-8-jdk wget curl ssh rsync netcat-openbsd && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local
RUN wget -q https://archive.apache.org/dist/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz && \
    tar -xzf hadoop-${HADOOP_VERSION}.tar.gz && \
    mv hadoop-${HADOOP_VERSION} hadoop && \
    rm hadoop-${HADOOP_VERSION}.tar.gz

WORKDIR /tmp
RUN wget -q https://archive.apache.org/dist/sqoop/${SQOOP_VERSION}/sqoop-${SQOOP_VERSION}.bin__hadoop-2.6.0.tar.gz && \
    tar -xzf sqoop-${SQOOP_VERSION}.bin__hadoop-2.6.0.tar.gz && \
    mv sqoop-${SQOOP_VERSION}.bin__hadoop-2.6.0 /usr/local/sqoop && \
    rm sqoop-${SQOOP_VERSION}.bin__hadoop-2.6.0.tar.gz

RUN wget -q https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.49/mysql-connector-java-5.1.49.jar && \
    mv mysql-connector-java-5.1.49.jar $SQOOP_HOME/lib/ && \
    wget -q https://repo1.maven.org/maven2/commons-lang/commons-lang/2.6/commons-lang-2.6.jar && \
    mv commons-lang-2.6.jar $SQOOP_HOME/lib/

RUN JAVA_HOME_REAL=$(readlink -f /usr/bin/java | sed 's:/bin/java::') && \
    mkdir -p $SQOOP_HOME/conf && \
    echo "export JAVA_HOME=$JAVA_HOME_REAL" > $SQOOP_HOME/conf/sqoop-env.sh && \
    echo "export HADOOP_HOME=$HADOOP_HOME" >> $SQOOP_HOME/conf/sqoop-env.sh

RUN mkdir -p $HADOOP_HOME/etc/hadoop

CMD ["tail", "-f", "/dev/null"]
