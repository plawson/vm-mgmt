#!/bin/bash
vboxmanage createvm \
    --ostype Ubuntu_64 \
    --basefolder "/home/plawson/virtualbox" \
    --register \
    --name "Ubuntu"

vboxmanage modifyvm "Ubuntu" \
    --memory 15360 \
    --nic1 bridged --bridgeadapter1 enp5s0 \
    --vrde on --vrdeport 3389 \
    --macaddress1 08002790d4b5

vboxmanage createhd \
    --filename "/synology1/VM/Ubuntu.vdi" \
    --format VDI --size 20480

vboxmanage storagectl "Ubuntu" \
    --name "SATA" \
    --add sata \
    --bootable on

vboxmanage storageattach "Ubuntu" \
    --storagectl SATA --port 0 --type hdd \
    --medium "/synology1/VM/Ubuntu.vdi"

vboxmanage storageattach "Ubuntu" \
    --storagectl SATA --port 15 --type dvddrive \
    --medium /home/plawson/virtualbox/my_iso/ubuntu-20.04.1-live-server-amd64-plawson.iso


vboxmanage startvm "Ubuntu"
#vboxmanage startvm "Ubuntu" --type headless
