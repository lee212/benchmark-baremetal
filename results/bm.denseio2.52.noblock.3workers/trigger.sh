while [ 1 ]; do is_bastion_running=`ssh -o StrictHostKeyChecking=no opc@129.146.47.98 "ps -ef|grep bastion.sh |grep -v grep|wc -l"`; if [ 0 -eq $is_bastion_running ]; then break; else sleep 60; fi;done
ssh -o StrictHostKeyChecking=no root@129.146.140.238 yum install -y git
ssh -o StrictHostKeyChecking=no root@129.146.140.238 mkdir /var/lib/hadoop-hdfs/.ssh
ssh -o StrictHostKeyChecking=no root@129.146.140.238 cp .ssh/authorized_keys /var/lib/hadoop-hdfs/.ssh
ssh -o StrictHostKeyChecking=no root@129.146.140.238 chown -R hdfs: /var/lib/hadoop-hdfs/.ssh
scp -o StrictHostKeyChecking=no benchmark_trigger_cmd.txt hdfs@129.146.140.238:.
ssh hdfs@129.146.140.238 mkdir hibench_extra_for_spark
scp hibench_extra_for_spark/* hdfs@129.146.140.238:./hibench_extra_for_spark
ssh -o BatchMode=yes -o StrictHostKeyChecking=no -o ConnectTimeout=7200 hdfs@129.146.140.238 bash benchmark_trigger_cmd.txt
scp hdfs@129.146.140.238:results.tar.gz bm.denseio2.52.noblocks.3nodes.bigdata/
