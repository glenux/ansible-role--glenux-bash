
WP_UID="${WP_UID:-"$(id -u)"}"
WP_GID="${WP_GID:-"$(id -g)"}"

export WP_UID
export WP_GID

docker_tags () {
  request="$1"
  repo="$(echo "$request" | awk '{split($0,a,"/"); print a[1];}')"
  name="$(echo "$request" | awk '{split($0,a,"/"); print a[2];}')"
  # >&2 echo "repo: $repo"
  # >&2 echo "name: $name"
  if [ -z "$name" ]; then
  	  # >&2 echo "Using 'library' as repository name"
	  name="$repo"
  	  repo="library"
  fi
  >&2 echo "Looking for $repo/$name"

  # Initial URL
  url="https://registry.hub.docker.com/v2/repositories/$repo/$name/tags/?page_size=100"
  (
    # Keep looping until the variable URL is empty
    while [ ! -z "$url" ]; do
      # >&2 echo "$url"
      # Every iteration of the loop prints out a single dot to show progress as it got through all the pages (this is inline dot)
      >&2 printf "."
      # Curl the URL and pipe the output to Python. Python will parse the JSON and print the very first line as the next URL (it will leave it blank if there are no more pages)
      # then continue to loop over the results extracting only the name; all will be stored in a variable called content
      content="$(curl -s "$url" | python -c 'import sys, json; data = json.load(sys.stdin); print(data.get("next", "") or ""); print("\n".join([x["name"] for x in data["results"]]))')"
      # Let's get the first line of content which contains the next URL for the loop to continue
      url="$(echo "$content" | head -n 1)"
      # Print the content without the first line (yes +2 is counter intuitive)
      echo "$content" | tail -n +2
    done;
    # Finally break the line of dots
    >&2 echo
  ) | cut -d '-' -f 1 | sort --version-sort --unique;
}

