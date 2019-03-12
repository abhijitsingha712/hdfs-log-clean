
#!/bin/bash

echo "Before cleaning up" > /home/hdfs/script-output.txt
hdfs dfs -df -h / >> /home/hdfs/script-output.txt
CURRENT=$(hdfs dfs -df -h / | grep / | awk '{ print $8}' | sed 's/%//g')
THRESHOLD=80

if [ "$CURRENT" -gt "$THRESHOLD" ] ; then
        hdfs dfs -rm -r -skipTrash /user/spark/.Trash/*
fi

echo "After cleaning up" >> /home/hdfs/script-output.txt
hdfs dfs -df -h / >> /home/hdfs/script-output.txt

echo "Script running time" `date` >> /home/hdfs/script-output.txt


