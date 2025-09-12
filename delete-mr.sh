#!/usr/bin/env sh

if [ $# -eq 0 ]; then
  echo "No name provided (usage \`delete-mr.sh myfeature\`)"
  exit 1
fi

jj bookmark delete "glob:prop/merge/$1/*"
