#!/bin/bash
./mkvm.sh --name github-actions --user plawson --type server --basefolder /home/plawson --mac 080027a17aba --cpu 12 --memory 65536 --disk 2097152 --password $1 --salt $2
