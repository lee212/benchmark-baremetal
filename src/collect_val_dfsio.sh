# dfsio generates output, this script collects a value from files and provide a list.
# 
# usage: $0 write|read [column name]
# e.g. collect.sh write Throughput
# e.g. collect.sh read "exec time"
#
# template to read, for example:
#
# ----- TestDFSIO ----- : write
#            Date & time: Sun Dec 09 18:46:34 GMT 2018
#        Number of files: 2048
# Total MBytes processed: 20480.0
#      Throughput mb/sec: 2.7679143049406325
# Average IO rate mb/sec: 6.124936580657959
#  IO rate std deviation: 7.520326575025008
#     Test exec time sec: 136.15
# 
# ----- TestDFSIO ----- : read
#            Date & time: Sun Dec 09 18:49:47 GMT 2018
#        Number of files: 2048
# Total MBytes processed: 20480.0
#      Throughput mb/sec: 21.00808010971798
# Average IO rate mb/sec: 33.195125579833984
#  IO rate std deviation: 29.057104590653495
#     Test exec time sec: 136.368
# 
if [ "$1" == "write" ]
then
nr=1
else
#read
nr=2
fi

if [ "$2" != "" ]
then
keyword=$2
else
keyword="exec time"
fi

if [ "$3" != "" ]
then
nnodes=$3
else
nnodes=3
fi

data_120=""
data_240=""
data_360=""
data[0]=""
data[1]=""
data[2]="" 
shift_120_240_360=0

for i in `find ./`
do
if [[ ${i:2:5} != "dfsio" ]]
then
continue
fi
nmap=`echo $i |awk -F "." '{print $3}'`
#echo $nmap
val=`awk "/$keyword/" $i|awk "NR == $nr"| awk -F ":" '{print $2}'`
#echo ${data[$shift_120_240_360]}
if [ "$keyword" == "Throughput" ]
then
val=`awk "BEGIN { print $val * $nmap / $nnodes }"`
fi
data[$shift_120_240_360]=${data[$shift_120_240_360]}", "$val
shift_120_240_360=`expr $shift_120_240_360 + 1`
if [ 3 -eq $shift_120_240_360 ] 
then
shift_120_240_360=0
fi

done
echo ${data[0]}
echo ${data[1]}
echo ${data[2]}
