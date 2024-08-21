#!/bin/bash

# unset variable set by kubernetes
unset SPARK_MASTER_PORT

mkdir -p /tmp/.java/.systemPrefs
mkdir /tmp/.java/.userPrefs
chmod -R 755 /tmp/.java
export JAVA_OPTS="-Djava.util.prefs.systemRoot=/tmp/.java -Djava.util.prefs.userRoot=/tmp/.java/.userPrefs"
  
