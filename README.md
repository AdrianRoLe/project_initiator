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
-b: Only Run ...

## Example:
$ cat configs/example.conf<br />
<br />
docker_dir="path/to/you/docker"<br />
backend_dir="path/to/you/backend"<br />
frontend_dir="path/to/you/frontend"<br />
backend_commands=declare -a array("bash exec -i")<br />
frontend_commands=declare -a array("npm start", "npx tailwindcss -i ./tailwind_dir/src/input.css -o ./tailwind_dir/dist/output.css --watch")

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

