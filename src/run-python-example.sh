#!/bin/bash

# test the hadoop cluster by running wordcount

# create input directory on HDFS
hadoop fs -mkdir -p input

# put input files to HDFS
hdfs dfs -put ./twits input/

# run wordcount
hadoop jar $HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar -file mapper.py -file reducer.py -file states -file dic.txt -mapper "python3 mapper.py" -reducer "python3 reducer.py" -input input/twits -output output/twits

# print the input files
# echo -e "\ninput example.txt:"
# hdfs dfs -cat input/example.txt

# print the output of wordcount
echo -e "\nwordcount output:"
hdfs dfs -cat output/part-00000

