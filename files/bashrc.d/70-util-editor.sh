#!/bin/sh

# Pager detection
for pager in vim nano emacs ; do
	if hash $pager 2> /dev/null ; then
		export PAGER=$pager
		break
	fi
done

