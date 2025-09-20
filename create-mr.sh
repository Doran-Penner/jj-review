#!/usr/bin/env sh

if [ $# -eq 0 ]; then
  echo "No name provided (usage \`./create-mr.sh myfeature\`)"
  exit 1
fi

echo "Creating & pushing first version of merge request $1"

jj git push --named prop/merge/"$1"/v1=@
