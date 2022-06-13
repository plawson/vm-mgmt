#!/bin/bash
./mkvm.sh --name airflow-control-dask --user plawson --type server --basefolder /home/plawson --mac 02a447719c86 --cpu 4 --memory 32768 --disk 1048576 --password $1 --salt $2
./mkvm.sh --name airflow-worker1-dask --user plawson --type server --basefolder /home/plawson --mac 02d0d9eb03cd --cpu 8 --memory 32768 --disk 1048576 --password $1 --salt $2
./mkvm.sh --name airflow-elk1-dask --user plawson --type server --basefolder /home/plawson --mac 02d5abf1ff87 --cpu 4 --memory 32768 --disk 1048576 --password $1 --salt $2
./mkvm.sh --name airflow-db-dask --user plawson --type server --basefolder /home/plawson --mac 024d35cf81e4 --cpu 4 --memory 32768 --disk 1048576 --password $1 --salt $2
