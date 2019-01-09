import json
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("--file", help="json to import resource infomation", default="benchmark_resources.json")
args = parser.parse_args()

def gen_vars(data, prefix):
	msg = []
	for k,v in data.items():
		msg.append ("export {0}{1}={2}".format(prefix, k, v))

	return "\n".join(msg)

with open(args.file) as f:
	data = json.load(f)
	for k1, v1 in data.items():
		print ("source env-vars")
		print ("> .worker_info")
		for k2, v2 in v1.items():
			if k2 == "TF_VAR":
				print (gen_vars(v2, "TF_VAR_"))
			elif k2 == "B_VAR":
				print ("printf '{}' >> .worker_info".format(gen_vars(v2, "B_VAR_")))
			elif k2 == "_block":
				print ("if [ -L \"block.tf\" ]; then rm block.tf; fi")
				if 'linked_filename' in v2:
					print ("ln -s {0} block.tf".format(v2['linked_filename']))
					print ("sed -i -e 's/enable_data_tiering=\"0\"/enable_data_tiering=\"1\"/' ../scripts/disk_setup.sh")
				else:
					print ("sed -i -e 's/enable_data_tiering=\"1\"/enable_data_tiering=\"0\"/' ../scripts/disk_setup.sh")
		print ("env|grep TF")
		print ("echo \"terraform apply======================\"")
		print ("terraform init;terraform plan;terraform apply -auto-approve\n")
		print ("mkdir {0}".format(k1))
		print ("cp terraform.tfstate {0}/".format(k1))
		print ("python benchmark_trigger.py --title {0} > {0}/trigger.sh".format(k1))
		print ("bash {0}/trigger.sh 2>> {0}/error.log 1> {0}/trigger.log".format(k1))
		print ("while [ 1 ]; do if [ -e \"{0}/results.tar.gz\" ] ; then break; else sleep 60; fi; done".format(k1))
		print ("echo \"terraform destroy====================\"")
		print ("terraform destroy -auto-approve >> {0}/terraform.log".format(k1))

