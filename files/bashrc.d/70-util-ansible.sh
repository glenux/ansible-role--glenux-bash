
# Disable ansible cowsay
if hash ansible > /dev/null 2>&1 ; then
	export ANSIBLE_NOCOWS=1
fi

