#!/bin/sh

##
# Set up Go environment
#

if hash go > /dev/null 2>&1; then
	if [ -d "$HOME/bin" ]; then
		export GOPATH="$HOME/src/Go"
		export PATH="$GOPATH/bin:$PATH"

		# For QT
		export CGO_CXXFLAGS_ALLOW=".*"
		export CGO_LDFLAGS_ALLOW=".*"
		export CGO_CFLAGS_ALLOW=".*"

		export QT_DIR=/usr/lib/x86_64-linux-gnu/qt5
		export QT_PKG_CONFIG=true
	fi
fi
