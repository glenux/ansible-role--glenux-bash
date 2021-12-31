
MOZ_TOKEN_FILE="$HOME/.config/mozilla-vpn/token"
if [ -f "$MOZ_TOKEN_FILE" ]; then
	. "$MOZ_TOKEN_FILE"
fi
