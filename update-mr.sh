#!/usr/bin/env sh

if [ $# -eq 0 ]; then
  echo "No name provided (usage \`./update-mr.sh myfeature\`)"
  exit 1
fi

if [ $# -ge 2 ]; then
  echo "Too many arguments provided! (usage \`./create-mr.sh myfeature\`)"
  exit 1
fi

# do we want --revisions @ ? I feel like we don't
x="$(jj bookmark list --sort name- | rg "c/r/$1/v[^:]+" --only-matching --max-count 1)"

if [ -z "${x}" ]; then
  echo "MR $1 not found, create it with \`create-mr.sh\`"
  exit 1
fi

new_ver="$(echo $x | rev | cut -d "v" -f 1 | rev)"

echo "Creating & pushing new version of merge request $1"

jj git push --named c/r/"$1"/v"$(( new_ver + 1 ))"=@
