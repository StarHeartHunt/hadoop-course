# hadoop-course

Run build-image.sh to build Docker image.

```bash
./build-image.sh
```

Run following command to create a bridge Network for connecting nodes.

```bash
sudo docker network create --driver=bridge hadoop
```

Run start-container to start master and worker node containers and open master node terminal. By default, 2 DataNodes are started.

```bash
./start-container.sh
```

After opening the master node terminal, run start-hadoop.sh to start hadoop services (HDFS, YARN). You can view web interface of Hadoop at the url <http://localhost:8088/>

```bash
./start-hadoop.sh
```

Run example Java MapReduce word count task after starting hadoop. Results are displayed on the terminal.

```bash
./run-wordcount.sh
```

To run example Python task after Java example, input and output directories should be deleted in HDFS to run an example again.

List folders in HDFS

```bash
hdfs dfs -ls
```

Delete input folder

```bash
hdfs dfs -rm -r input
```

Delete output folder

```bash
hdfs dfs -rm -r output
```

Run python example

```bash
./run-python-example.sh
```

To stop hadoop and close docker containers run following commands

```bash
./stop-hadoop.sh
exit
```

-- Example usage to put csv file to HDFS

Download the data from [here](https://www.kaggle.com/datasets/mryanm/luflow-network-intrusion-detection-data-set/data) and extract it to the `data` folder.

Run the python code data_process.py to merge multiple files into one file and apply required preprocessing.

Upload the merged.csv file to HDFS using the following command:

```bash
hdfs dfs -put merged.csv "your_location_here"
```
