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
export nmap=`expr 35 \* $nnodes`
export fsize=3428MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=6857MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=13714MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


export nmap=`expr 52 \* $nnodes`
export fsize=2307MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=4615MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=9230MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


export nmap=`expr 104 \* $nnodes`
export fsize=1153MB

{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=2307MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt

export fsize=4615MB
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles $nmap -fileSize $fsize -resFile logs/dfsio.$nmap.$fsize -bufferSize 128000000 ; } 2>> dfsio.bigdata.time.txt 1>> dfsio.bigdata.out.txt


tar cvzf ~/results.tar.gz *.txt logs
