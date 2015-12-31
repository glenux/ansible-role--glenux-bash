#!/bin/sh 

ansible-playbook role.yml \
	--limit "$(uname -n)"  \
	-e "bash_users=['$USER']" \
	-e "role_path=$(pwd)"

