
KONSOLE_PROFILE_NAME=""
if hash qdbus 2>&1 >/dev/null ; then
	if [ -n "$KONSOLE_DBUS_SERVICE" ] && [ -n "$KONSOLE_DBUS_SESSION" ]; then
		KONSOLE_PROFILE_NAME="$(qdbus $KONSOLE_DBUS_SERVICE $KONSOLE_DBUS_SESSION profile)"
	fi
fi

export KONSOLE_PROFILE_NAME
