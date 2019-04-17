#sudo yum install -y git
#sudo su - hdfs
git clone https://github.com/lee212/benchmark-baremetal.git
cd ~/benchmark-baremetal/
git checkout dev
cd src
cp *.jar ~/
#python batch.py -w dfsio,kmeans,pagerank,terasort,wordcount -s bigdata > cmd.sh
mkdir logs
#bash cmd.sh

export nnodes=3
export nmap=`expr 20 \* $nnodes`
export fsize=2000MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -D dfs.replication=1 -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -D dfs.replication=1 -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -D dfs.replication=2 -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -D dfs.replication=2 -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=4000MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=6000MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


export nmap=`expr 25 \* $nnodes`
export fsize=1600MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=3200MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=4800MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


export nmap=`expr 30 \* $nnodes`
export fsize=1333MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=2666MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=4000MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


export nmap=`expr 35 \* $nnodes`
export fsize=1142MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=2285MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=3428MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


export nmap=`expr 40 \* $nnodes`
export fsize=1000MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=2000MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=3000MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export nmap=`expr 45 \* $nnodes`
export fsize=888MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=1777MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=2666MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


export nmap=`expr 50 \* $nnodes`
export fsize=800MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=1600MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=2400MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export nmap=`expr 55 \* $nnodes`
export fsize=727MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=1454MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=2181MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export nmap=`expr 60 \* $nnodes`
export fsize=666MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=1333MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=2000MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


export nmap=`expr 65 \* $nnodes`
export fsize=615MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=1230MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=1846MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


export nmap=`expr 70 \* $nnodes`
export fsize=571MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=1142MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=1714MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


export nmap=`expr 75 \* $nnodes`
export fsize=533MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=1066MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=1600MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt




tar cvzf ~/results.tar.gz *.txt logs
