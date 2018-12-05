{ time /usr/bin/hadoop fs -rm -r -skipTrash /Terasort/Input; } 2>> terasort.tiny.time.txt 1>> terasort.tiny.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen 32000 /Terasort/Input; } 2>> terasort.tiny.time.txt 1>> terasort.tiny.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Terasort/Output; } 2>> terasort.tiny.time.txt 1>> terasort.tiny.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort /Terasort/Output; } 2>> terasort.tiny.time.txt 1>> terasort.tiny.out.txt
{ time hadoop fs -rm -r -skipTrash /Kmeans/Input; } 2>> kmeans.tiny.time.txt 1>> kmeans.tiny.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/autogen-7.1-SNAPSHOT-jar-with-dependencies.jar org.apache.mahout.clustering.kmeans.GenKMeansDataset -D hadoop.job.history.user.location=/Kmeans/Input/samples -sampleDir /Kmeans/Input/samples -clusterDir /Kmeans/Input/cluster -numClusters 5 -numSamples 30000 -samplesPerFile 6000 -sampleDimension 3; } 2>> kmeans.tiny.time.txt 1>> kmeans.tiny.out.txt
{ time hadoop fs -rm -r -skipTrash /Kmeans/Output; } 2>> kmeans.tiny.time.txt 1>> kmeans.tiny.out.txt
{ time mahout kmeans --input /Kmeans/Input/samples --output /Kmeans/Output --clusters /Kmeans/Input/cluster --maxIter 5 --overwrite --clustering --convergenceDelta 0.5 --distanceMeasure  org.apache.mahout.common.distance.EuclideanDistanceMeasure --method mapreduce; } 2>> kmeans.tiny.time.txt 1>> kmeans.tiny.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles 16 -fileSize 1 -resFile logs/dfsio.16.1 -bufferSize 4096; } 2>> dfsio.tiny.time.txt 1>> dfsio.tiny.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles 16 -fileSize 1 -resFile logs/dfsio.16.1 -bufferSize 4096; } 2>> dfsio.tiny.time.txt 1>> dfsio.tiny.out.txt
{ time hadoop fs -rm -r -skipTrash /Pagerank/Input; } 2>> pagerank.tiny.time.txt 1>> pagerank.tiny.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/autogen-7.1-SNAPSHOT-jar-with-dependencies.jar HiBench.DataGen -t pagerank -b /Pagerank -n Input -m 8 -r 8 -p 50 -pbalance -pbalance -o text; } 2>> pagerank.tiny.time.txt 1>> pagerank.tiny.out.txt
{ time hadoop fs -rm -r -skipTrash /Pagerank/Output; } 2>> pagerank.tiny.time.txt 1>> pagerank.tiny.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/pegasus-2.0-SNAPSHOT.jar pegasus.PagerankNaive /Pagerank/Input/edges /Pagerank/Output 50 8 1 nosym new; } 2>> pagerank.tiny.time.txt 1>> pagerank.tiny.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Wordcount/Input; } 2>> wordcount.tiny.time.txt 1>> wordcount.tiny.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar randomtextwriter -D mapreduce.randomtextwriter.totalbytes=32000 -D mapreduce.randomtextwriter.bytespermap=4000 /Wordcount/Input; } 2>> wordcount.tiny.time.txt 1>> wordcount.tiny.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Wordcount/Output; } 2>> wordcount.tiny.time.txt 1>> wordcount.tiny.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar wordcount /Wordcount/Input /Wordcount/Output; } 2>> wordcount.tiny.time.txt 1>> wordcount.tiny.out.txt
