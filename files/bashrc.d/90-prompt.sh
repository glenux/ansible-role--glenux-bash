#!/bin/sh

##
# PROMPT DEFINITIONS.
#

ps1_show() {
	local format=$1
	local fun=$2
	local str=""
	str=$($fun)

	if [ ! -z "$str" ]; then
		printf "$format\n" "$str"
	fi
}

ps1_timetracking() {
	local active_tracking=""
	local active_tags_count=""
	local active_tags=""
	local current_tag=""
	local bar_icon=""
	local dom_prefix=""
	# exit if timew is not installed
	if ! hash timew > /dev/null 2>&1 ; then
		return 0
	fi

	# exit if no active tracking
	active_tracking="$(timew get dom.active)"
	if [ "$active_tracking" -eq 1 ]; then
		bar_icon="[▶]"
		dom_prefix="dom.active"
	else
		bar_icon="[■]"
		dom_prefix="dom.tracked.1"
	fi

	active_tags_count="$(timew get "$dom_prefix.tag.count")"
	if [ "$active_tags_count" -gt 0 ]; then
		suffix=""
		active_tags=""
		if [ "$active_tags_count" -gt 1 ] && [ "$active_tracking" -eq 0 ]; then
			# Bug when accessing multiple tags on non-active tasks
			suffix="…"
			active_tags_count=1
		fi
		for tagidx in $(seq 1 "$active_tags_count") ; do
			current_tag="$(timew get "$dom_prefix.tag.$tagidx")"
			active_tags="$active_tags,$current_tag"
		done
		active_tags="$(echo "$active_tags" |cut -c2-)$suffix"
	else
		active_tags="(tag?)"
	fi
	echo "$bar_icon $active_tags "
}

ps1_vcs_branch() {
	local vcs=""
	local vcs_branch=""
	local vcs_root=""
	local vcs_root_path=""
	local vcs_root_url=""
	local vcs_branch_url=""

	if hash git > /dev/null 2>&1 && git rev-parse > /dev/null 2>&1; then
		vcs="git"
		vcs_branch=$(git symbolic-ref --short -q HEAD 2>/dev/null)
		vcs_branch=${vcs_branch:-(detached head)}
	elif hash hg > /dev/null 2>&1 && hg -q status > /dev/null 2>&1; then
		vcs="hg"
		vcs_branch=$(hg branch)
	elif hash svn > /dev/null 2>&1 && svn info > /dev/null 2>&1; then
		vcs="svn"
		# vcs_root_path=$(LANG=C LC_ALL=C svn info |sed -n  "s/^Working Copy Root Path: //p")
		vcs_root_url=$(cd "$vcs_root" || return ; LANG=C LC_ALL=C svn info |sed -n "s/^Repository Root: //p")
		vcs_branch_url=$(cd "$vcs_root" || return ; LANG=C LC_ALL=C svn info |sed -n "s/^URL: //p")
		vcs_branch=$(echo "$vcs_branch_url" |sed "s#^$vcs_root_url/##")
	fi

	if [ -z "$vcs" ]; then
		echo ""
	else
		echo "$vcs $vcs_branch"
	fi
}

#export PS1=" \t [#\#]\n[\u@\h \w]\\$ "
#PS1='\[\033[1;32m\][\t|\d]\[\033[1;33m\][\u@\h] \[\033[0;36m\]\w\$\[\033[0m\]\n '
PS1="${ps1_context:-}"
PS1=$PS1"▪ \[\e[1;0m\]\w\[\e[0m\] "

# Include VCS Info (eval at each line)
# shellcheck disable=SC2089
PS1=$PS1"\$(ps1_show '▪ \[\e[1;34m\]%s\[\e[0m\] ' ps1_vcs_branch)" # vcs branch

# Include DATETIME
# PS1=$PS1"▪ \[\e[0;32m\]\t\[\e[0m\] "

# Include TIME TRACKING (timewarrior)
PS1=$PS1"\$(ps1_show '▪ \[\e[1;32m\]%s\[\e[0m\] ' ps1_timetracking)" # timetracking

# Include command count
# PS1=$PS1": \[\e[1;34m\]#\#\[\e[0m\] :"

# Include USERNAME
PS1=$PS1"▪ \[\e[0;31m\]\u@\h "

# Include ARCHITECTURE (eval only once)
PS1=$PS1"($(uname -m))\[\e[0m\] "
PS1=$PS1"\n\$ "

# shellcheck disable=SC2090
export PS1

