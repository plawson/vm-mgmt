#!/bin/bash
./mkvm.sh --user plawson --type server --basefolder /home/plawson --name k8s-master1 --mac 080027f20846 --cpu 2 --memory 15360 --disk 1048576 --password $1 --salt $2
./mkvm.sh --user plawson --type server --basefolder /home/plawson --name k8s-master2 --mac 080027b18af7 --cpu 3 --memory 15360 --disk 1048576 --password $1 --salt $2
./mkvm.sh --user plawson --type server --basefolder /home/plawson --name k8s-master3 --mac 080027978bd5 --cpu 3 --memory 15360 --disk 1048576 --password $1 --salt $2
./mkvm.sh --user plawson --type server --basefolder /home/plawson --name k8s-node01 --mac 08002787d9c6 --cpu 3 --memory 15360 --disk 1048576 --password $1 --salt $2
./mkvm.sh --user plawson --type server --basefolder /home/plawson --name k8s-node02 --mac 080027749392 --cpu 3 --memory 15360 --disk 1048576 --password $1 --salt $2
./mkvm.sh --user plawson --type server --basefolder /home/plawson --name k8s-node03 --mac 0800277f7545 --cpu 3 --memory 15360 --disk 1048576 --password $1 --salt $2
./mkvm.sh --user plawson --type server --basefolder /home/plawson --name k8s-node04 --mac 080027940ef4 --cpu 3 --memory 15360 --disk 1048576 --password $1 --salt $2
./mkvm.sh --user plawson --type server --basefolder /home/plawson --name k8s-node05 --mac 080027c567c1 --cpu 3 --memory 15360 --disk 1048576 --password $1 --salt $2
