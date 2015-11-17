#!/bin/sh

###
# Set up Ruby environment
#
#export PATH=/var/lib/gems/1.8/bin:$PATH
if [[ -s "$HOME/.rbenv/bin/rbenv" ]]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi
