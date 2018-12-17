import time
import subprocess
import json
import os

def save_file(fname, content):
	with open(fname, "a+") as f:
		f.write(content)
	f.close()

def outputs(title, out, err):
	save_file(title + ".out", out)
	save_file(title + ".err", err)

with open("special.cmd") as f:
	content = f.readlines()

wtype = wl = f = ""
msg_all = []
os.environ['SPARKBENCH_PROPERTIES_FILES'] = "/var/lib/hadoop-hdfs/sparkbench.conf"

for cmd in content:
	if cmd[0] == "#":
		wtype, wl, f = cmd.split(",")
		wtype = wtype.translate(None, "# /\n")
		wl = wl.translate(None, "# /\n")
		f = f.translate(None, "# /\n")
		continue
	print (cmd)
	start = time.time()
	proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
	(out, err) = proc.communicate()
	end = time.time()
	print (out, err)
	fname = "{}_{}_{}".format(wtype, wl, f)
	outputs(fname, out, err)
	save_file(fname + ".time", str(end - start))
	msg_all.append({ "out": out, "err": err, "time": end - start })

with open("timeit_all.out" , "w") as f:
	json.dump(msg_all, f, indent=4)
f.close()
