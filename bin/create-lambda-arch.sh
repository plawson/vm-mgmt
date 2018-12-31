#!/bin/bash
sudo /bin/bash ./mkvm.sh --user plawson --name k8s-node01 --mac 080027b18af7 --cpu 1 --vmhosts lambda_hosts
sudo /bin/bash ./mkvm.sh --user plawson --name k8s-node02 --mac 080027978bd5 --cpu 1 --vmhosts lambda_hosts
sudo /bin/bash ./mkvm.sh --user plawson --name k8s-node03 --mac 08002787d9c6 --cpu 2 --vmhosts lambda_hosts
sudo /bin/bash ./mkvm.sh --user plawson --name k8s-node04 --mac 080027749392 --cpu 2 --vmhosts lambda_hosts
sudo /bin/bash ./mkvm.sh --user plawson --name k8s-node05 --mac 0800277f7545 --cpu 2 --vmhosts lambda_hosts
sudo /bin/bash ./mkvm.sh --user plawson --name k8s-node06 --mac 080027940ef4 --cpu 4 --vmhosts lambda_hosts
sudo /bin/bash ./mkvm.sh --user plawson --name k8s-node07 --mac 080027c567c1 --cpu 4 --vmhosts lambda_hosts
sudo /bin/bash ./mkvm.sh --user plawson --name k8s-node08 --mac 080027a3361e --cpu 4 --vmhosts lambda_hosts
sudo /bin/bash ./mkvm.sh --user plawson --name k8s-node09 --mac 08002735540f --cpu 2 --vmhosts lambda_hosts
sudo /bin/bash ./mkvm.sh --user plawson --name k8s-node10 --mac 08002773574b --cpu 1 --vmhosts lambda_hosts
