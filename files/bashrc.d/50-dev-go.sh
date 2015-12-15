#!/bin/sh

##
# Set up Go environment
#

if hash go > /dev/null 2>&1; then
	if [ -d "$HOME/bin" ]; then
		export GOPATH="$HOME/src/Go"
		export PATH="$GOPATH/bin:$PATH"
	fi
fi
