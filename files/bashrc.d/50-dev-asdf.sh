#!/bin/sh

###
# Set up Multi-language (asdf) environment
#
if [ -d "$HOME/.asdf" ] && [ -f "$HOME/.asdf/asdf.sh" ]; then
 . "$HOME/.asdf/asdf.sh"
 . "$HOME/.asdf/completions/asdf.bash"
fi
