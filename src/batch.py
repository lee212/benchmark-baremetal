import json
import argparse
import time

parser = argparse.ArgumentParser()
parser.add_argument("-w", "--workload", help="e.g. wordcount")
parser.add_argument("-s", "--size", help="e.g. tiny, small")
args = parser.parse_args()

for wl in args.workload.split(","):
	with open(wl + ".json") as f:
		data = json.load(f)
	for size in args.size.split(","):
		for cmd in data['cmds']:
			cmd_msg = (cmd % data["size"][size] )
			print ('{ ' + "time {};".format(cmd_msg) + ' }' + " 2>> {0}.{1}.time.txt 1>> {0}.{1}.out.txt".format(wl, size))

