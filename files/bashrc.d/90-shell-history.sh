
export HISTSIZE=10000
export HISTFILESIZE=10000

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups:erasedups
shopt -s histappend
# Reload history on each command
#PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

