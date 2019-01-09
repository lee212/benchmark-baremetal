import json
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--title")
args = parser.parse_args()

with open("terraform.tfstate") as f:
        jdata = json.load(f)
        cdh_utility_1 = (jdata['modules'][0]['resources']["data.oci_core_vnic.utility_node_vnic"]['primary']['attributes']['public_ip_address'])
        cdh_bastion_1 = (jdata['modules'][0]['resources']["data.oci_core_vnic.bastion_vnic"]['primary']['attributes']['public_ip_address'])
	print ("while [ 1 ]; do is_bastion_running=`ssh -o StrictHostKeyChecking=no opc@{0} \"ps -ef|grep bastion.sh |grep -v grep|wc -l\"`; if [ 0 -eq $is_bastion_running ]; then break; else sleep 60; fi;done".format(cdh_bastion_1))
	print ("ssh -o StrictHostKeyChecking=no root@{0} yum install -y git".format(cdh_utility_1))
	print ("ssh -o StrictHostKeyChecking=no root@{0} mkdir /var/lib/hadoop-hdfs/.ssh".format(cdh_utility_1))
	print ("ssh -o StrictHostKeyChecking=no root@{0} cp .ssh/authorized_keys /var/lib/hadoop-hdfs/.ssh".format(cdh_utility_1))
	print ("ssh -o StrictHostKeyChecking=no root@{0} chown -R hdfs: /var/lib/hadoop-hdfs/.ssh".format(cdh_utility_1))
	print ("scp -o StrictHostKeyChecking=no benchmark_trigger_cmd.txt hdfs@{0}:.".format(cdh_utility_1))
	print ("scp -o StrictHostKeyChecking=no .worker_info hdfs@{0}:.".format(cdh_utility_1))
	print ("ssh -o BatchMode=yes -o StrictHostKeyChecking=no -o ConnectTimeout=7200 hdfs@{0} bash benchmark_trigger_cmd.txt".format(cdh_utility_1))
	print ("scp hdfs@{0}:results.tar.gz {1}/".format(cdh_utility_1, args.title))

