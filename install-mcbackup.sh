INSTALL_PATH='/usr/local/bin'
printf "\nInstalling minecraft-backup-utility to ${INSTALL_PATH}.\n"
sudo chmod +x ./bin/minecraft-backup-utility.sh
sudo cp -p bin/minecraft-backup-utility.sh ${INSTALL_PATH}/mc-backup-utility && printf "\nInstalled successful.\nUse this command: mc-backup-utility.\n"
