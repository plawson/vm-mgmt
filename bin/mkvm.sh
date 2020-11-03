#/bin/bash

function usage {
	echo "$0: [-h] | --name VM_NAME --user USERNAME --type server_or_desktop --basefolder BASE_FOLDER [--mac MAC_ADDRESS] [--cpu #_CPU] [--memory MEMORY_IN_MB] [--disk STORAGE_IN_MB]"
	exit
}

function create_vm {
	# Parameters: $1 VM name, $2 vm owner
        if [[ $# -lt 7 ]]; then
                echo ""
                echo "ERROR: generate_iso wrong number of parameters ($#): $@"
                echo ""
                exit
        fi
        VM_NAME=$1
        VM_OWNER=$2
	VM_TYPE=$3
	VM_BASE_FOLDER=$4
	VM_MEMORY=$5
	VM_CPU=$6
	VM_DISK=$7
	MAC_ADDRESS=$8
	THE_DIR=$(dirname $0)

	if [[ ${USER} != "$VM_OWNER" ]]; then
                echo ""
                echo "ERROR: Script must be run as $VM_OWNER"
                echo ""
        fi

	# autoinstall config
	BASE_WEB_FOLDER="$VM_BASE_FOLDER"/www
	WEB_FOLDER="$BASE_WEB_FOLDER"/ubuntu
	mkdir -p "$WEB_FOLDER"
	cp -f $THE_DIR/../unattended_iso_customization/user-data."$VM_TYPE" "$WEB_FOLDER"/user-data
	sed -r -i 's@the_host_name@'${VM_NAME}'@' "$WEB_FOLDER"/user-data
	touch "$WEB_FOLDER"/meta-data

	BASE_FOLDER="$VM_BASE_FOLDER"/virtualbox
	ISO_MEDIA="$BASE_FOLDER"/my_iso/ubuntu-20.04.1-live-server-amd64.iso
	VDI_NAME=/synology1/VM/"$VM_NAME".vdi

	vboxmanage createvm --name $VM_NAME --basefolder "$BASE_FOLDER" --ostype Ubuntu_64 --register
	vboxmanage modifyvm $VM_NAME --memory ${VM_MEMORY} --nic1 bridged --bridgeadapter1 enp5s0
	if [[ "VM_TYPE" = "desktop" ]]; then
		vboxmanage modifyvm $VM_NAME --vrde on --vrdeport 3389
	fi
	if [[ ! -z "${MAC_ADDRESS}" ]]; then
		vboxmanage modifyvm $VM_NAME --macaddress1 $MAC_ADDRESS
	fi
	# vboxmanage modifyvm $VM_NAME --acpi on
	# vboxmanage modifyvm $VM_NAME --ioapic on
	vboxmanage modifyvm $VM_NAME --cpus ${VM_CPU}
	vboxmanage createhd --filename "$VDI_NAME" --size "$VM_DISK" --format VDI
	vboxmanage storagectl $VM_NAME --name "SATA" --add sata --bootable on
	vboxmanage storageattach $VM_NAME --storagectl "SATA" --port 0 --type hdd --medium "$VDI_NAME"
	vboxmanage storageattach $VM_NAME --storagectl "SATA" --port 15 --type dvddrive --medium "$ISO_MEDIA"
	
	cd "$BASE_WEB_FOLDER"
	nohup python3 -m http.server 3003 2>&1 1>/dev/null &
	HTTP_SRV=$!
	echo $HTTP_SRV

	vboxmanage startvm $VM_NAME --type headless
	# Comment the previousline and uncomment the below command when debugging your unattended iso install.
	# Note that uncommenting the below line will display the X11 install UI. In that case set your $DISPLAY variable accordingly before running the script or the istall might hang.
	#vboxmanage startvm $VM_NAME
	sleep 1800
	kill -15 $HTTP_SRV
}

POSITIONAL=()
while [[ $# -gt 0 ]]
do
	key="$1"
	case $key in
	--name)
		VM_NAME="$2"
		shift # past argument
		shift # past value
		;;
	--user)
		VM_OWNER="$2"
		shift # past argument
		shift # past value
		;;
	--mac)
		MAC_ADDRESS="$2"
		shift # past argument
		shift # past value
		;;
	--cpu)
		VM_CPU="$2"
		shift # past argument
		shift # past value
		;;
	--memory)
		VM_MEMORY="$2"
		shift # past argument
		shift # past value
		;;
	--type)
		VM_TYPE="$2"
		shift # past argument
		shift # past value
		;;
	--basefolder)
		VM_BASE_FOLDER="$2"
		shift # past argument
		shift # past value
		;;
	--disk)
		VM_DISK="$2"
		shift # past argument
		shift # past value
		;;
	-h)
		usage
		;;
	*) # unknown option
		POSITIONAL+=("$1") # save it in an array for later
		shift # past argument
		;;
	esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

if [[ -z "${VM_NAME// }" ]]; then
	usage
fi

if [[ -z "${VM_OWNER// }" ]]; then
	usage
fi

if [[ -z "${VM_TYPE// }" ]]; then
	usage
fi

if [[ "$VM_TYPE" != "server" && "$VM_TYPE" != "desktop" ]]; then
	echo "Invalid --type value: $VM_TYPE"
	usage
fi

if [[ -z "${VM_BASE_FOLDER// }" ]]; then
	usage
fi

if [[ -z "${MAC_ADDRESS// }" ]]; then
	MAC_ADDRESS=""
fi

if [[ -z "${VM_CPU// }" ]]; then
	VM_CPU="3"
fi

if [[ -z "${VM_MEMORY// }" ]]; then
	VM_MEMORY="15360"
fi

if [[ -z "${VM_DISK// }" ]]; then
	VM_DISK="20480"
fi


create_vm $VM_NAME $VM_OWNER $VM_TYPE $VM_BASE_FOLDER $VM_MEMORY $VM_CPU $VM_DISK $MAC_ADDRESS
