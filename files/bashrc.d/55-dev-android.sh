#!/bin/sh

###
# Set up Android environment
#
ANDROIDDIR="$HOME/src/Android"
if [ -d "$ANDROIDDIR" ]; then
	export PATH=$ANDROIDDIR/Sdk/platform-tools:$ANDROIDDIR/Sdk/tools:$PATH
fi

if [ -d "$HOME/android-sdk-linux" ]; then
	export PATH="$HOME/android-sdk-linux/build-tools/19.1.0:$PATH"
	export PATH="$HOME/android-sdk-linux/tools:$PATH"
	export ANDROID_HOME="$HOME/android-sdk-linux/"
fi
