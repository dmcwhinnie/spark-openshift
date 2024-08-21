# base image
FROM openjdk:17

# define spark and hadoop versions
ENV SPARK_VERSION=3.3.4
ENV HADOOP_VERSION=3.3.4

# download and install hadoop
RUN mkdir -p /opt && \
    cd /opt && \
    wget --no-verbose http://10.2.66.129/hadoop/hadoop-${HADOOP_VERSION}.tar.gz

RUN cd /opt && \
    tar -xzf hadoop-${HADOOP_VERSION}.tar.gz hadoop-${HADOOP_VERSION}/lib/native && \
    ln -s hadoop-${HADOOP_VERSION} hadoop && \
    echo Hadoop ${HADOOP_VERSION} native libraries installed in /opt/hadoop/lib/native

# download and install spark
RUN mkdir -p /opt && \
    cd /opt && \ 
     wget --no-verbose http://10.2.66.129/spark/spark-${SPARK_VERSION}-bin-without-hadoop.tgz 
     
RUN cd /opt/ && \
    tar -zxf  spark-${SPARK_VERSION}-bin-without-hadoop.tgz && \
    ln -s spark-${SPARK_VERSION}-bin-without-hadoop spark && \
    echo Spark ${SPARK_VERSION} installed in /opt

# add scripts and update spark default config
ADD common.sh spark-master spark-worker /
ADD spark-defaults.conf /opt/spark/conf/spark-defaults.conf

ENV SPARK_HOME="/opt/spark"  
ENV HADOOP_HOME="/opt/hadoop"  

ENV PATH="$SPARK_HOME/bin:$HADOOP_HOME/bin:$PATH"
ENV SPARK_DIST_CLASSPATH = $(/opt/hadoop/bin classpath)
