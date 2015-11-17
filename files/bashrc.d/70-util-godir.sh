
if hash gx-search-baloo >/dev/null 2>&1 ; then
	function godir() {
		dir=$(gx-search-baloo "$@")
		cd "$dir"
	}
fi

