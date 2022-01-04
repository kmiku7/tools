#/bin/bash
# Gets from `https://stackoverflow.com/questions/38313733/bulk-change-of-git-remote-origin-in-various-repositories-bash-command`

SEARCH_ROOT=./
PATTERN=github.com  # Change this part as your need
REPLACEMENT=gitlab.com  # Change this part as your need
find "$SEARCH_ROOT" -type d -name "\.git"  -print | while read -r REPO;
do
  pushd "$REPO/../" > /dev/null || continue
  NEWURL=$(git remote get-url origin | grep "$PATTERN" | sed "s/$PATTERN/$REPLACEMENT/g")
  [ -z "$NEWURL" ] || git remote set-url origin "$NEWURL"
  popd > /dev/null || exit 1
done
