INSTALL_PATH='/usr/local/bin'
SCRIPT='mc-backup-utility'
printf "\nInstalling minecraft-backup-utility to ${INSTALL_PATH}.\n"
sudo chmod +x ./bin/${SCRIPT}.sh
sudo cp -p bin/${SCRIPT}.sh ${INSTALL_PATH}/${SCRIPT} && printf "\nInstalled successful.\nUse this command: mc-backup-utility.\n"
