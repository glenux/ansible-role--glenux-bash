
# Help darcs on network mounts
if hash darcs > /dev/null 2>&1 ; then
	export DARCS_SLOPPY_LOCKS=1
fi

