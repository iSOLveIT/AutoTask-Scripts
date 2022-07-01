#!/bin/bash

sudo -i logout

function setup {
	local exec_path=$1 
	exec_path+="/LearnToCodeRPG.sh"
	local icon_path=$1 
	icon_path+="/presplash.png"
	local version=1.0
	local desktop_config=""
	
	sudo chmod ugo+x "$exec_path"
	
	printf -v desktop_config "[Desktop Entry]\nEncoding=UTF-8\nVersion=$version\nType=Application\nTerminal=false\nExec=$exec_path  %%U\nName=LearnToCodeRPG\nIcon=$icon_path"
	
	dsk_home="$HOME/LearnToCodeRPG.desktop"
	echo "$desktop_config" > $dsk_home
}

setup $1

# echo $dsk_home

sudo mv $dsk_home "/usr/share/applications" 
echo "Done, Bro"
