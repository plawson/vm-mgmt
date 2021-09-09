#!/bin/bash
./mkvm.sh --name github-actions1 --user plawson --type server --basefolder /home/plawson --mac 080027a17aba --cpu 5 --memory 32768 --disk 1048576 --password $1 --salt $2
./mkvm.sh --name github-actions2 --user plawson --type server --basefolder /home/plawson --mac 0800270241c8 --cpu 5 --memory 32768 --disk 1048576 --password $1 --salt $2
./mkvm.sh --name github-actions3 --user plawson --type server --basefolder /home/plawson --mac 0800278a1d42 --cpu 5 --memory 32768 --disk 1048576 --password $1 --salt $2
