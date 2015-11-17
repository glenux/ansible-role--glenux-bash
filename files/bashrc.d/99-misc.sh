#source /etc/bash_completion

export EDITOR=vim

# disable deprecated variable
export GREP_OPTIONS=

# load sub-bashrc

## 01-10 environment changes (XX-environment-...)
## 11-20 applications specific environment changes (XX-application-...)
## 81-99 shell customisation (colors, prompt, etc.) 
## 91-99 aliases and completion

export SHELL_ISLOGIN=${SHELL_ISLOGIN:-0}
#echo $SHELL_ISLOGIN

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

###
# DISPLAY & COLORS
#

export LS_COLORS="$LS_COLORS*.flac=01;35:"

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
#??? shopt -s checkwinsize


# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
# export GTK2_RC_FILES=$HOME/.gtkrc-2.0


##
# APPLICATION-SPECIFIC SETUP
# 

# This line was appended by KDE
# Make sure our customised gtkrc file is loaded.
export GTK2_RC_FILES=$HOME/.gtkrc-2.0

# Help darcs on network mounts
export DARCS_SLOPPY_LOCKS=1

# Disable ansible cowsay
export ANSIBLE_NOCOWS=1

function godir() {
	dir=$(gx-search-baloo "$@")
	cd "$dir"
}



