#!/bin/sh

###
# Set up Android environment
#
ANDROIDDIR=$HOME/.adt-bundle
if [[ -e "$ANDROIDDIR" ]]; then
	export PATH=$ANDROIDDIR/sdk/platform-tools:$ANDROIDDIR/sdk/tools:$PATH
fi

