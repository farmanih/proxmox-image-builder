#!/usr/bin/env bash
######################################
# Get Enviromanet Varibles of Script # 
######################################
source .env
FILE=getenv_FILE
FILE_NAME=getenv_FILENAME
TMP_PATH=getenv_TEM_PATH


##############################
# Define Functions of Script #
##############################
function package_exists() {
    return dpkg -l "$1" &> /dev/null
}

############################
# Check Statment of Script #
############################
if [[ -f "$FILE" ]]; then
    echo "$FILE exists, contine to proccessing image."
else
    wget "$FILE" -O "$TMP_PATH/$FILE_NAME"
fi
if ! package_exists libguestfs-tools ; then
    echo ”Please install libguestfs-tools"
else
    echo ”libguestfs-tools exosts, contine to proccessing image."
fi


###########################
# Prosses Tasks of Script #
###########################
virt-customize -a "$TMP_PATH/$FILE_NAME" \
--update \
--install 'qemu-guest-agent, python' \
--run-command 'systemctl enable qemu-guest-agent' \
--run-command 'apt autoremove -y && apt autoclean -y && apt clean && rm -rf /var/lib/apt/lists/*' \
--timezone "$getenv_TIMEZON"
