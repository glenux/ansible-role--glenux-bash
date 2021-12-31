# Go forward in Git commit hierarchy, towards particular commit 
# Usage:
#  gofwd v1.2.7
# Does nothing when the parameter is not specified.
gitfwd() {
  git checkout "$(git rev-list --topo-order HEAD.."$*" | tail -1)"
}

# Go back in Git commit hierarchy
# Usage: 
#  goback
alias gitback='git checkout HEAD~'

