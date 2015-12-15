#!/bin/sh

# Pager detection
for pager in most less more ; do
	if hash $pager 2> /dev/null ; then
		export PAGER=$pager
		break
	fi
done

