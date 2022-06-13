#!/bin/bash
vboxmanage startvm airflow-db-celery --type headless
vboxmanage startvm airflow-elk1-celery --type headless
vboxmanage startvm airflow-control-celery --type headless
vboxmanage startvm airflow-worker1-celery --type headless
