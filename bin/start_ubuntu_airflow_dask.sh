#!/bin/bash
vboxmanage startvm airflow-db-dask --type headless
vboxmanage startvm airflow-elk1-dask --type headless
vboxmanage startvm airflow-control-dask --type headless
vboxmanage startvm airflow-worker1-dask --type headless
