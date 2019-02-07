FIO Test on block storages
===============================================================================

During the `experiment
<https://github.com/lee212/benchmark-baremetal/blob/dev/oci%20baremetal%20benchmark%20v2.ipynb>`_
, *fio* ran to validate IOPS and throughput on different block sizes, and this
subdirectory contains the scripts and outputs along with observed system data,
i.e. iostat and iftop.

Environment
-------------------------------------------------------------------------------

- region: PHX-AD-1
- instance type: BM.Standard2.52
- blocks: 31 volumes with 667GB provisioned size
  - expected IOPS: 25000 at 4k
  - expected Throughput: 320MiB/s at 256k
- mounts: /data1 - 31

::
           
        NAME   MAJ:MIN RM  SIZE RO TYPE MOUNTPOINT
        sdy     65:128  0  667G  0 disk /data24
        sdf      8:80   0  667G  0 disk /data5
        sdab    65:176  0  667G  0 disk /data27
        sdo      8:224  0  667G  0 disk /data14
        sdw     65:96   0  667G  0 disk /data22
        sdd      8:48   0  667G  0 disk /data3
        sdm      8:192  0  667G  0 disk /data12
        sdu     65:64   0  667G  0 disk /data20
        sdb      8:16   0  667G  0 disk /data1
        sdk      8:160  0  667G  0 disk /data10
        sds     65:32   0  667G  0 disk /data18
        sdi      8:128  0  667G  0 disk /data8
        sdq     65:0    0  667G  0 disk /data16
        sdae    65:224  0  667G  0 disk /data30
        sdz     65:144  0  667G  0 disk /data25
        sdg      8:96   0  667G  0 disk /data6
        sdac    65:192  0  667G  0 disk /data28
        sdx     65:112  0  667G  0 disk /data23
        sde      8:64   0  667G  0 disk /data4
        sdaa    65:160  0  667G  0 disk /data26
        sdn      8:208  0  667G  0 disk /data13
        sdv     65:80   0  667G  0 disk /data21
        sdc      8:32   0  667G  0 disk /data2
        sdl      8:176  0  667G  0 disk /data11
        sdt     65:48   0  667G  0 disk /data19
        sda      8:0    0 46.6G  0 disk
        ├─sda2   8:2    0    8G  0 part [SWAP]
        ├─sda3   8:3    0 38.4G  0 part /
        └─sda1   8:1    0  200M  0 part /boot/efi
        sdj      8:144  0  667G  0 disk /data9
        sdr     65:16   0  667G  0 disk /data17
        sdaf    65:240  0  667G  0 disk /data31
        sdh      8:112  0  667G  0 disk /data7
        sdp      8:240  0  667G  0 disk /data15
        sdad    65:208  0  667G  0 disk /data29

FIO configuration
-------------------------------------------------------------------------------

fio scripts are available in each subdirectory with a *.fio* file extension,
which contains options like:

- fio block size: 4k, 16k, 256k
- fio rw: randread, randrw, randwrite
- script format: [block size].[io type].fio

Run
-------------------------------------------------------------------------------

To avoid reaching instance limit e.g. 2900MiB/s throughput, single run was
completed towards 8 mountpoints, in total finishing 4 runs.

- 1st: /data1, /data2, /data3, /data4, /data5, /data6, /data7, /data8
- 2nd: /data9, /data10, /data11, /data12, /data13, /data14, /data15, /data16
- 3rd: /data17, /data18, /data19, /data20, /data21, /data22, /data23, /data24
- 4th*: /data25, /data26, /data27, /data28, /data29, /data30, /data31

* note that 4th run only contains 7 blocks where others contain 8 blocks

Output
-------------------------------------------------------------------------------

*.fio.output files in each subdirectory contain *fio* output per block size and
io type.

- file format: [block size].[io type].fio.output

iostat
-------------------------------------------------------------------------------

iostat.*.log files in each subdirectory contain *iostat* output per block size
and io type.

- file format: [block size].[io type].fio.output

iftop
-------------------------------------------------------------------------------

iftop.log file in each subdirectory contains *iftop* output per run.

