source .env
FILE_NAME=$getenv_FILE_NAME
FILE_URL=$getenv_FILE_URL
TMP_PATH=$getenv_TMP_PATH
TEMPLATE_ID=$getenv_TEMPLATE_ID
TEMPLATE_NAME=$getenv_TEMPLATE_NAME
TEMPLATE_INFO=$getenv_TEMPLATE_INFO
TEMPLATE_OS_TYPE=$getenv_TEMPLATE_OS_TYPE
TEMPLATE_BIOS=$getenv_TEMPLATE_BIOS
TEMPLATE_AGENT=$getenv_TEMPLATE_AGENT
TEMPLATE_CPU_TYPE=$getenv_TEMPLATE_CPU_TYPE
TEMPLATE_CPU_SOCKETS=$getenv_TEMPLATE_CPU_SOCKETS
TEMPLATE_CPU_CORE=$getenv_TEMPLATE_CPU_CORE
TEMPLATE_CPU_VCORE=$getenv_TEMPLATE_CPU_VCORE
TEMPLATE_MEMORY=$getenv_TEMPLATE_MEMORY
TEMPLATE_BALLOON=$getenv_TEMPLATE_BALLOON
TEMPLATE_NETWOR_BRIDGE=$getenv_TEMPLATE_NETWOR_BRIDGE
TEMPLATE_IMAGE_DISK=$getenv_TEMPLATE_IMAGE_DISK
TEMPLATE_IMAGE_CI=$getenv_TEMPLATE_IMAGE_CI
TEMPLATE_VGA=$getenv_TEMPLATE_VGA
TEMPLATE_SERIAL_0=$getenv_TEMPLATE_SERIAL_0
TEMPLATE_PATH=$getenv_TEMPLATE_PATH
TEMPLATE_DISK=$getenv_TEMPLATE_DISK
TEMPLATE_DISK_ID=$getenv_TEMPLATE_DISK_ID
TEMPLATE_DISK_SIZE=$getenv_TEMPLATE_DISK_SIZE

qm create "$TEMPLATE_ID" \
--name "$TEMPLATE_NAME" \
--description "$TEMPLATE_INFO" \
--ostype "$TEMPLATE_OS_TYPE" \
--bios "$TEMPLATE_BIOS" \
--boot c --bootdisk "$TEMPLATE_DISK_ID" \
--agent "$TEMPLATE_AGENT" \
--cpu cputype="$TEMPLATE_CPU_TYPE" \
--sockets "$TEMPLATE_CPU_SOCKETS" \
--cores "$TEMPLATE_CPU_CORE" \
--vcpu "$TEMPLATE_CPU_VCORE" \
--memory "$TEMPLATE_MEMORY" \
--balloon "$TEMPLATE_BALLOON" \
--net0 virtio,bridge="$TEMPLATE_NETWOR_BRIDGE" \
--scsihw virtio-scsi-pci \
--virtio0 "$TEMPLATE_IMAGE_DISK" \
--ide2 "$TEMPLATE_IMAGE_CI" \
--vga "$TEMPLATE_VGA" \
--hotplug disk,network,usb \
--serial0 "$TEMPLATE_SERIAL_0" 

#qm importdisk "$TEMPLATE_ID" "$TMP_PATH/$FILE_NAME" "$TEMPLATE_DISK"
#qm resize "$TEMPLATE_ID" "$TEMPLATE_DISK_ID" "$TEMPLATE_DISK_SIZE"
#qm template "$TEMPLATE_ID"
