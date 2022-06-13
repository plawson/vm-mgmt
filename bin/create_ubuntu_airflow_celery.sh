#!/bin/bash
./mkvm.sh --name airflow-control-celery --user plawson --type server --basefolder /home/plawson --mac 028d27bc457e --cpu 4 --memory 32768 --disk 1048576 --password $1 --salt $2
./mkvm.sh --name airflow-worker1-celery --user plawson --type server --basefolder /home/plawson --mac 02cd8bcec23b --cpu 8 --memory 32768 --disk 1048576 --password $1 --salt $2
./mkvm.sh --name airflow-elk1-celery --user plawson --type server --basefolder /home/plawson --mac 0247394f6a40 --cpu 4 --memory 32768 --disk 1048576 --password $1 --salt $2
./mkvm.sh --name airflow-db-celery --user plawson --type server --basefolder /home/plawson --mac 0274eaf1b819 --cpu 4 --memory 32768 --disk 1048576 --password $1 --salt $2
