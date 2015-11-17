#!/bin/sh

###
# Set up GNUSIDE CLOUD environment
#
GNUSIDE_CLOUD_PATH="$HOME/Documents/_GnusideCloud"

if [[ -s "$GNUSIDE_CLOUD_PATH/bin" ]]; then
	export PATH="$GNUSIDE_CLOUD_PATH/bin:$PATH"
fi
