#!/usr/bin/env sh

if [ $# -eq 0 ]; then
  echo "No name provided (usage \`./update-mr.sh myfeature\`)"
  exit 1
fi

# do we want --revisions @ ? I feel like we don't
x="$(jj bookmark list --sort name- | rg "prop/merge/$1/v[^:]+" --only-matching --max-count 1)"

if [ -z "${x}" ]; then
  echo "MR $1 not found, create it with \`create-mr.sh\`"
  exit 1
fi

new_ver="$(echo $x | rev | cut -d "v" -f 1 | rev)"

echo "Creating new version of merge request $1"

jj bookmark create -r @ prop/merge/"$1"/v"$(( new_ver + 1 ))"

echo "Pushing new version"

jj git push -b prop/merge/"$1"/v"$(( new_ver + 1 ))"
