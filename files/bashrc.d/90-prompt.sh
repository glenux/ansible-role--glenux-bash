#!/bin/sh

##
# PROMPT DEFINITIONS.
#

ps1_show() {
	local format=$1
	local fun=$2
	local str=$($fun)

	if [ ! -z "$str" ]; then
		printf "$format\n" "$str"
	fi
}

ps1_vcs_branch() {
	local vcs=""
	local vcs_branch=""
	local vcs_root=""
	local vcs_root_path=""
	local vcs_root_url=""
	local vcs_branch_url=""

	{
		if hash git && git rev-parse; then
			vcs='git'
			vcs_branch=$(git branch |sed -n "s/\* \(.*\)/\1/p")
		elif hash hg && hg -q status; then
			vcs='hg'
			vcs_branch=$(hg branch)
		elif hash svn && svn info; then
			vcs='svn'
			vcs_root_path=$(LANG=C LC_ALL=C svn info |sed -n  's/^Working Copy Root Path: //p')
			vcs_root_url=$(cd "$vcs_root" ; LANG=C LC_ALL=C svn info |sed -n 's/^Repository Root: //p')
			vcs_branch_url=$(cd "$vcs_root" ; LANG=C LC_ALL=C svn info |sed -n 's/^URL: //p')
			vcs_branch=$(echo "$vcs_branch_url" |sed "s#^$vcs_root_url/##")
		fi
	} >/dev/null 2>&1

	if [ -z "$vcs" ]; then
		echo ""
	else
		echo "$vcs:$vcs_branch"
	fi
}

#export PS1=" \t [#\#]\n[\u@\h \w]\\$ "
#PS1='\[\033[1;32m\][\t|\d]\[\033[1;33m\][\u@\h] \[\033[0;36m\]\w\$\[\033[0m\]\n '

PS1="$ps1_context ."
PS1=$PS1": \[\e[1;33m\]\w\[\e[0m\] :"
PS1=$PS1"\`ps1_show ': \[\e[1;34m\]%s\[\e[0m\] :' ps1_vcs_branch\`" # vcs branch
PS1=$PS1": \[\e[0;32m\]\t\[\e[0m\] :"
#PS1=$PS1": \[\e[1;34m\]#\#\[\e[0m\] :" #command count
PS1=$PS1": \[\e[0;31m\]\u@\h "  #username
PS1=$PS1"("`uname -m`")\[\e[0m\] :" # architecture
PS1=$PS1":.\n\$ "
export PS1

