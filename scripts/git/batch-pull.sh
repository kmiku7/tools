#/bin/bash
# Finds all local git repo in `SEARCH_ROOT`, and then executes the `pull` operation in it.

SEARCH_ROOT=./
find "$SEARCH_ROOT" -type d -name "\.git"  -print | while read -r REPO;
do
  pushd "$REPO/../" > /dev/null || continue
  REPO_DIR=`pwd`
  git pull
  ret_val=$?
  [ ${ret_val} -eq 0 ] ||  echo "Pull \"${REPO_DIR}\" failed."
  popd > /dev/null || exit 1
done
