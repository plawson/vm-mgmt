#!/bin/bash

vboxmanage startvm k8s-master1 --type headless
vboxmanage startvm k8s-node01 --type headless
vboxmanage startvm k8s-node02 --type headless
vboxmanage startvm k8s-node03 --type headless
vboxmanage startvm k8s-node04 --type headless
vboxmanage startvm k8s-node05 --type headless
vboxmanage startvm k8s-node06 --type headless
vboxmanage startvm k8s-node07 --type headless
