# Project Initiator
Tired of wasting hundreds of commands on finding the correct directory for you projects?<br />
This script organizes all your projects into one single file!<br />

## How it works:
You just need to create the <project_name>.conf file with the desired variables.

## How to run:
$ ./project_initiator.sh <conf_filename>

## Structure requirements:
All configuration files MUST be placed inside a directory called "configs" in the same one as this script.<br />
(If you want yo change this, replace the "configs_dir" variable inside this script with your desired directory)


### Available options (order do not matter):
 -b -> Only run backend commands<br />
 -c -> Only open VSCode<br />
 -d -> Only wake up docker<br />
 -f -> Only run frontend commands<br />
 -h -> Show this message only (other options will not run)<br />

## Example:
$ vim configs/example.conf<br />
<br />
docker_dir="path/to/your/docker"<br />
backend_dir="path/to/your/backend"<br />
frontend_dir="path/to/your/frontend"<br />
declare -a backend_commands='("xdg-open https://www.google.com && exec bash -i" "ng serve")'<br />
declare -a frontend_commands='("npm run tailwind" "npm start")'<br />

##### Initiate whole script
$ ./project_initiator.sh example

##### Show help message
$ ./project_initiator.sh example -h

##### Start docker only
$ ./project_initiator.sh example -d

##### Start docker and execute backend commands
$ ./project_initiator.sh example -b -d

##### Open VSCode only
$ ./project_initiator.sh example -c

