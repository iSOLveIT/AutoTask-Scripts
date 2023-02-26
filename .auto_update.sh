#!/bin/bash

sudo -i logout
printf "\n===========\nUPDATE TASK\n===========\n"
sudo apt update
printf "\n============\nUPGRADE TASK\n============\n"
sudo apt upgrade
printf "\n--Automatic apt update and upgrade completed--\n"

