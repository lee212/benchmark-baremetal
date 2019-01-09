import os
import re
import math
import json
import argparse
import time

parser = argparse.ArgumentParser()
parser.add_argument("-w", "--workload", help="e.g. wordcount")
parser.add_argument("-s", "--size", help="e.g. tiny, small")
args = parser.parse_args()

def _render_vars(var_dict):
	# TBD
	for k, v in var_dict.items():
		if not isinstance(v, unicode):
			continue
		eval_msg = re.match("{{(.*)}}(.*)", v)
		if eval_msg:
			var_dict[k] = "{}{}".format(eval(eval_msg.group(1)), eval_msg.group(2))

	return var_dict
	
for wl in args.workload.split(","):
	with open(wl + ".json") as f:
		data = json.load(f)
	for size in args.size.split(","):
		for cmd in data['cmds']:
			cmd_msg = (cmd % _render_vars(data["size"][size]) )
			print ("{{ time {0} 2>> {1}.{2}.out.txt; }} 2>> {1}.{2}.time.txt 1>> {1}.{2}.out.txt".format(cmd_msg, wl, size))

