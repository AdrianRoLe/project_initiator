# Project Initiator
Tired of wasting hundreds of commands on finding the correct directory for you projects?<br />
This script organizes all your projects into one single file!<br />

## How it works:
You just need to create the <project_name>.conf file with the desired variables.

## Example:
$ cat configs/example.conf<br />
<br />
docker_dir="path/to/you/docker"<br />
backend_dir="path/to/you/backend"<br />
frontend_dir="path/to/you/frontend"<br />
backend_commands=declare -a array("bash exec -i")<br />
frontend_commands=declare -a array("npm start", "npx tailwindcss -i ./tailwind_dir/src/input.css -o ./tailwind_dir/dist/output.css --watch")
