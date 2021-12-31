#!/bin/sh

###
# Set up Ruby environment
#
#export PATH=/var/lib/gems/1.8/bin:$PATH
if [ -s "$HOME/.rbenv/bin/rbenv" ]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi


SONARPATH="/usr/local/sonar-scanner-3.3.0.1492-linux"
if [ -d "$SONARPATH" ]; then
	export PATH="$PATH:$SONARPATH/bin"
fi
