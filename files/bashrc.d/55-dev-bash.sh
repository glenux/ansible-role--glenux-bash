
# Change tab behaviour 
# - inline completion (menu-complete)
# - of simple suggestion (complete) => default

# bind TAB:menu-complete
case "${-:-}" in
*i*) # This shell is interactive
	bind TAB:complete
	;;
*)	# This shell is not interactive 
	;;
esac

