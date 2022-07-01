#!/bin/bash

sudo -i logout
printf "UPDATE TASK\n-------------------------------------------------\n"
sudo apt update
printf "\n"
printf "UPGRADE TASK\n-------------------------------------------------\n"
sudo apt upgrade
printf "\nAutomatic update and upgrade finished.\n"
