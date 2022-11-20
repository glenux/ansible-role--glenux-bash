#!/bin/sh

##
# Set up OCaml environment
#
if hash opam > /dev/null 2>&1 ; then
	eval $(opam config env)

	# OPAM configuration
	. /home/warbrain/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
fi

