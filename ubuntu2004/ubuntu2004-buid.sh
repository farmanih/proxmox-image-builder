#!/usr/bin/env bash
######################################
# Get Enviromanet Varibles of Script # 
######################################
source .env
FILE_NAME=$getenv_FILE_NAME
FILE_URL=$getenv_FILE_URL
TMP_PATH=$getenv_TMP_PATH
TIMEZONE=$getenv_TIMEZONE


##############################
# Define Functions of Script #
##############################
function package_exists() {
    return dpkg -l "$1" &> /dev/null
}

############################
# Check Statment of Script #
############################
if [[ -f "$FILE_NAME" ]]; then
    echo "$FILE_NAME exists, continue to processing image."
    cp "$FILE_NAME" "$FILE_PATH/$FILE_NAME"
else
    wget "$FILE_URL" -O "$TMP_PATH/$FILE_NAME"
fi

if ! package_exists libguestfs-tools ; then
    echo "Please install libguestfs-tools"
else
    echo "libguestfs-tools exists, continue to processing image."
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
