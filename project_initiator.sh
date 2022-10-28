#!/bin/bash
echo "--$1--"

#Show help
if [[ "$*" == *"-h"* ]]; then
	echo "Help:"
	echo " -b -> Only run backend commands"
	echo " -c -> Only open VSCode"
	echo " -d -> Only wake up docker"
	echo " -f -> Only run frontend commands"
	echo " -h -> Show this message only (other options will not run)"
else
	#import configurations from arg1
	configurations_path=configs
	. "$configurations_path/$1.conf"
	echo "Selected docker directory from $1 as: $docker_dir"
	echo "Selected backend directory from $1 as: $backend_dir"
	echo "Selected frontend directory from $1 as: $frontend_dir"

	#Run backend commands
	if [[ "$*" == *"-b"* ]] || [ $# == 1 ]; then
		for command in "${backend_commands[@]}"; do
			echo "Running '$command'..."
			gnome-terminal -- bash -c "cd $backend_dir;$command"
		done
	fi
	#Open VSCode
	if [[ "$*" == *"-c"* ]] || [ $# == 1 ]; then
		gnome-terminal -- bash -c "code $frontend_dir $backend_dir"
	fi
	#Wake up/down docker
	if [[ "$*" == *"-d"* ]] || [ $# == 1 ]; then
		#docker-compose up docker, and docker-compose down on close
		gnome-terminal -- bash -c "cd $docker_dir;docker-compose -f  docker-compose.yml up --remove-orphans; docker-compose -f  docker-compose.yml down --remove-orphans;"
	fi
	#Run frontend commands
	if [[ "$*" == *"-f"* ]] || [ $# == 1 ]; then
		for command in "${frontend_commands[@]}"; do
			echo "Running '$command'..."
			gnome-terminal -- bash -c "cd $frontend_dir;$command"
		done
	fi
fi
