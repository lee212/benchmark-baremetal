{ time /usr/bin/hadoop fs -rm -r -skipTrash /Terasort/Input; } 2>> terasort.small.time.txt 1>> terasort.small.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen 3200000 /Terasort/Input; } 2>> terasort.small.time.txt 1>> terasort.small.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Terasort/Output; } 2>> terasort.small.time.txt 1>> terasort.small.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort /Terasort/Output; } 2>> terasort.small.time.txt 1>> terasort.small.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Terasort/Input; } 2>> terasort.large.time.txt 1>> terasort.large.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen 32000000 /Terasort/Input; } 2>> terasort.large.time.txt 1>> terasort.large.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Terasort/Output; } 2>> terasort.large.time.txt 1>> terasort.large.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort /Terasort/Output; } 2>> terasort.large.time.txt 1>> terasort.large.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Terasort/Input; } 2>> terasort.huge.time.txt 1>> terasort.huge.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar teragen 320000000 /Terasort/Input; } 2>> terasort.huge.time.txt 1>> terasort.huge.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Terasort/Output; } 2>> terasort.huge.time.txt 1>> terasort.huge.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar terasort /Terasort/Output; } 2>> terasort.huge.time.txt 1>> terasort.huge.out.txt
{ time hadoop fs -rm -r -skipTrash /Kmeans/Input; } 2>> kmeans.small.time.txt 1>> kmeans.small.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/autogen-7.1-SNAPSHOT-jar-with-dependencies.jar org.apache.mahout.clustering.kmeans.GenKMeansDataset -D hadoop.job.history.user.location=/Kmeans/Input/samples -sampleDir /Kmeans/Input/samples -clusterDir /Kmeans/Input/cluster -numClusters 5 -numSamples 3000000 -samplesPerFile 600000 -sampleDimension 20; } 2>> kmeans.small.time.txt 1>> kmeans.small.out.txt
{ time hadoop fs -rm -r -skipTrash /Kmeans/Output; } 2>> kmeans.small.time.txt 1>> kmeans.small.out.txt
{ time mahout kmeans --input /Kmeans/Input/samples --output /Kmeans/Output --clusters /Kmeans/Input/cluster --maxIter 5 --overwrite --clustering --convergenceDelta 0.5 --distanceMeasure  org.apache.mahout.common.distance.EuclideanDistanceMeasure --method mapreduce; } 2>> kmeans.small.time.txt 1>> kmeans.small.out.txt
{ time hadoop fs -rm -r -skipTrash /Kmeans/Input; } 2>> kmeans.large.time.txt 1>> kmeans.large.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/autogen-7.1-SNAPSHOT-jar-with-dependencies.jar org.apache.mahout.clustering.kmeans.GenKMeansDataset -D hadoop.job.history.user.location=/Kmeans/Input/samples -sampleDir /Kmeans/Input/samples -clusterDir /Kmeans/Input/cluster -numClusters 5 -numSamples 20000000 -samplesPerFile 4000000 -sampleDimension 20; } 2>> kmeans.large.time.txt 1>> kmeans.large.out.txt
{ time hadoop fs -rm -r -skipTrash /Kmeans/Output; } 2>> kmeans.large.time.txt 1>> kmeans.large.out.txt
{ time mahout kmeans --input /Kmeans/Input/samples --output /Kmeans/Output --clusters /Kmeans/Input/cluster --maxIter 5 --overwrite --clustering --convergenceDelta 0.5 --distanceMeasure  org.apache.mahout.common.distance.EuclideanDistanceMeasure --method mapreduce; } 2>> kmeans.large.time.txt 1>> kmeans.large.out.txt
{ time hadoop fs -rm -r -skipTrash /Kmeans/Input; } 2>> kmeans.huge.time.txt 1>> kmeans.huge.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/autogen-7.1-SNAPSHOT-jar-with-dependencies.jar org.apache.mahout.clustering.kmeans.GenKMeansDataset -D hadoop.job.history.user.location=/Kmeans/Input/samples -sampleDir /Kmeans/Input/samples -clusterDir /Kmeans/Input/cluster -numClusters 5 -numSamples 100000000 -samplesPerFile 20000000 -sampleDimension 20; } 2>> kmeans.huge.time.txt 1>> kmeans.huge.out.txt
{ time hadoop fs -rm -r -skipTrash /Kmeans/Output; } 2>> kmeans.huge.time.txt 1>> kmeans.huge.out.txt
{ time mahout kmeans --input /Kmeans/Input/samples --output /Kmeans/Output --clusters /Kmeans/Input/cluster --maxIter 5 --overwrite --clustering --convergenceDelta 0.5 --distanceMeasure  org.apache.mahout.common.distance.EuclideanDistanceMeasure --method mapreduce; } 2>> kmeans.huge.time.txt 1>> kmeans.huge.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles 32 -fileSize 10 -resFile logs/dfsio.32.10 -bufferSize 4096; } 2>> dfsio.small.time.txt 1>> dfsio.small.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles 32 -fileSize 10 -resFile logs/dfsio.32.10 -bufferSize 4096; } 2>> dfsio.small.time.txt 1>> dfsio.small.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles 64 -fileSize 10 -resFile logs/dfsio.64.10 -bufferSize 4096; } 2>> dfsio.large.time.txt 1>> dfsio.large.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles 64 -fileSize 10 -resFile logs/dfsio.64.10 -bufferSize 4096; } 2>> dfsio.large.time.txt 1>> dfsio.large.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -write -nrFiles 256 -fileSize 100 -resFile logs/dfsio.256.100 -bufferSize 4096; } 2>> dfsio.huge.time.txt 1>> dfsio.huge.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-client-jobclient-2.6.0-cdh5.16.1-tests.jar TestDFSIO -read -nrFiles 256 -fileSize 100 -resFile logs/dfsio.256.100 -bufferSize 4096; } 2>> dfsio.huge.time.txt 1>> dfsio.huge.out.txt
{ time hadoop fs -rm -r -skipTrash /Pagerank/Input; } 2>> pagerank.small.time.txt 1>> pagerank.small.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/autogen-7.1-SNAPSHOT-jar-with-dependencies.jar HiBench.DataGen -t pagerank -b /Pagerank -n Input -m 204 -r 204 -p 5000 -pbalance -pbalance -o text; } 2>> pagerank.small.time.txt 1>> pagerank.small.out.txt
{ time hadoop fs -rm -r -skipTrash /Pagerank/Output; } 2>> pagerank.small.time.txt 1>> pagerank.small.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/pegasus-2.0-SNAPSHOT.jar pegasus.PagerankNaive /Pagerank/Input/edges /Pagerank/Output 5000 204 1 nosym new; } 2>> pagerank.small.time.txt 1>> pagerank.small.out.txt
{ time hadoop fs -rm -r -skipTrash /Pagerank/Input; } 2>> pagerank.large.time.txt 1>> pagerank.large.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/autogen-7.1-SNAPSHOT-jar-with-dependencies.jar HiBench.DataGen -t pagerank -b /Pagerank -n Input -m 204 -r 204 -p 500000 -pbalance -pbalance -o text; } 2>> pagerank.large.time.txt 1>> pagerank.large.out.txt
{ time hadoop fs -rm -r -skipTrash /Pagerank/Output; } 2>> pagerank.large.time.txt 1>> pagerank.large.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/pegasus-2.0-SNAPSHOT.jar pegasus.PagerankNaive /Pagerank/Input/edges /Pagerank/Output 500000 204 1 nosym new; } 2>> pagerank.large.time.txt 1>> pagerank.large.out.txt
{ time hadoop fs -rm -r -skipTrash /Pagerank/Input; } 2>> pagerank.huge.time.txt 1>> pagerank.huge.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/autogen-7.1-SNAPSHOT-jar-with-dependencies.jar HiBench.DataGen -t pagerank -b /Pagerank -n Input -m 204 -r 204 -p 5000000 -pbalance -pbalance -o text; } 2>> pagerank.huge.time.txt 1>> pagerank.huge.out.txt
{ time hadoop fs -rm -r -skipTrash /Pagerank/Output; } 2>> pagerank.huge.time.txt 1>> pagerank.huge.out.txt
{ time hadoop jar /var/lib/hadoop-hdfs/pegasus-2.0-SNAPSHOT.jar pegasus.PagerankNaive /Pagerank/Input/edges /Pagerank/Output 5000000 204 1 nosym new; } 2>> pagerank.huge.time.txt 1>> pagerank.huge.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Wordcount/Input; } 2>> wordcount.small.time.txt 1>> wordcount.small.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar randomtextwriter -D mapreduce.randomtextwriter.totalbytes=320000000 -D mapreduce.randomtextwriter.bytespermap=40000000 /Wordcount/Input; } 2>> wordcount.small.time.txt 1>> wordcount.small.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Wordcount/Output; } 2>> wordcount.small.time.txt 1>> wordcount.small.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar wordcount /Wordcount/Input /Wordcount/Output; } 2>> wordcount.small.time.txt 1>> wordcount.small.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Wordcount/Input; } 2>> wordcount.large.time.txt 1>> wordcount.large.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar randomtextwriter -D mapreduce.randomtextwriter.totalbytes=3200000000 -D mapreduce.randomtextwriter.bytespermap=400000000 /Wordcount/Input; } 2>> wordcount.large.time.txt 1>> wordcount.large.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Wordcount/Output; } 2>> wordcount.large.time.txt 1>> wordcount.large.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar wordcount /Wordcount/Input /Wordcount/Output; } 2>> wordcount.large.time.txt 1>> wordcount.large.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Wordcount/Input; } 2>> wordcount.huge.time.txt 1>> wordcount.huge.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar randomtextwriter -D mapreduce.randomtextwriter.totalbytes=32000000000 -D mapreduce.randomtextwriter.bytespermap=4000000000 /Wordcount/Input; } 2>> wordcount.huge.time.txt 1>> wordcount.huge.out.txt
{ time /usr/bin/hadoop fs -rm -r -skipTrash /Wordcount/Output; } 2>> wordcount.huge.time.txt 1>> wordcount.huge.out.txt
{ time /usr/bin/hadoop jar /opt/cloudera/parcels/CDH/lib/hadoop-mapreduce/hadoop-mapreduce-examples.jar wordcount /Wordcount/Input /Wordcount/Output; } 2>> wordcount.huge.time.txt 1>> wordcount.huge.out.txt
