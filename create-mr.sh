#!/usr/bin/env sh

if [ $# -eq 0 ]; then
  echo "No name provided (usage \`./create-mr.sh myfeature\`)"
  exit 1
fi

echo "Creating first version of merge request $1"

jj bookmark create -r @ prop/merge/"$1"/v1
