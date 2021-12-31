
# Install one or more versions of specified language
# e.g. `vmi rust` # => fzf multimode, tab to mark, enter to install
# if no plugin is supplied (e.g. `vmi<CR>`), fzf will list them for you
# Mnemonic [V]ersion [M]anager [I]nstall
asdf_install() {
  local lang="$1"
  local versions=""

  if [ -z "$lang" ]; then
    lang=$(asdf plugin-list | fzf)
  fi

  if [ -n "$lang" ]; then
    versions=$(asdf list-all "$lang" | fzf -m)
    if [ -n "$versions" ]; then
      for version in $versions; do
      	  asdf install "$lang" "$version"
      done
    fi
  fi
}

# Remove one or more versions of specified language
# e.g. `vmi rust` # => fzf multimode, tab to mark, enter to remove
# if no plugin is supplied (e.g. `vmi<CR>`), fzf will list them for you
# Mnemonic [V]ersion [M]anager [C]lean
asdf_clean() {
  local lang="$1"
  local versions=""

  if [ -z "$lang" ]; then
    lang=$(asdf plugin-list | fzf)
  fi

  if [ -n "$lang" ]; then
    versions="$(asdf list "$lang" | fzf -m)"
    if [ -n "$versions" ]; then
      for version in $versions; do
      	  asdf uninstall "$lang" "$version"
      done
    fi
  fi
}

. $HOME/.asdf/asdf.sh
