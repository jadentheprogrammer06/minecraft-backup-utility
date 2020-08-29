#!/bin/bash

# NOTE:
# This script will not run if any process containing the string "minecraft" is found. This may include the script itself or minecraft-launcher for example.
# For this reason, the executable script should be renamed to "mc-backup-utility". Also make sure to close any minecraft process that is running.

# variables.
PC_USERNAME=`whoami`
WORKING_DIR=`pwd`
MINECRAFT_RUNNING=`pgrep minecraft`
DATETIME=$(date +"_%T_%m_%d_%y")
# directory variables. Modify these to suit your needs.
DOTMINECRAFT="/home/${PC_USERNAME}/.minecraft"
BACKUP_FOLDER="/home/${PC_USERNAME}/Documents/backup-dotminecraft"

# exit if supplied .minecraft directory isn't found or if any minecraft process is found currently running.
[[ -d ${DOTMINECRAFT} ]] && echo "${DOTMINECRAFT} directory existent." || DIR_NOT_FOUND=1
[[ ${DIR_NOT_FOUND} == 1 ]] && echo "${DOTMINECRAFT} directory non-existent. You can change the .minecraft location used, if you use a custom directory, OR, you do not have minecraft installed." && exit
[[ ${MINECRAFT_RUNNING} ]] && echo "minecraft process running; not backing up saves while game is running in order to avoid corruption of data." && exit || BACKUP_FILES=1

if [[ ${BACKUP_FILES} == 1 ]] 
then
    echo "backing up ${DOTMINECRAFT} directory into ${BACKUP_FOLDER}"
    [[ -d ${BACKUP_FOLDER} ]] && echo "${BACKUP_FOLDER} exists. this is your backup folder." || BACKUP_NOT_FOUND=1
    [[ ${BACKUP_NOT_FOUND} == 1 ]] && echo "${BACKUP_FOLDER} non-existent; creating ${BACKUP_FOLDER} folder." && mkdir -p ${BACKUP_FOLDER}
    echo "copying .minecraft folder and its files..."
    [[ -d ${BACKUP_FOLDER}/.minecraft ]] && mv ${BACKUP_FOLDER}/.minecraft ${BACKUP_FOLDER}/.minecraft${DATETIME} && echo "Renamed previous backup to ${BACKUP_FOLDER}/.minecraft${DATETIME}"
    cp ${DOTMINECRAFT} ${BACKUP_FOLDER}/.minecraft -r && echo '.minecraft folder copied successfully. Note: enable "show hidden files" in your file-browser to view your .minecraft folder.'
fi
