#!/bin/bash

vboxmanage unregistervm k8s-master1 --delete
vboxmanage unregistervm k8s-node01 --delete
vboxmanage unregistervm k8s-node02 --delete
vboxmanage unregistervm k8s-node03 --delete
vboxmanage unregistervm k8s-node04 --delete
vboxmanage unregistervm k8s-node05 --delete
vboxmanage unregistervm k8s-node06 --delete
vboxmanage unregistervm k8s-node07 --delete
