#!/usr/bin/env sh

if [ $# -eq 0 ]; then
  echo "No name provided (usage \`delete-mr.sh myfeature\`)"
  exit 1
fi

if [ $# -ge 2 ]; then
  echo "Too many arguments provided! (usage \`./create-mr.sh myfeature\`)"
  exit 1
fi

jj bookmark delete "glob:c/r/$1/*"
jj git push -b "glob:c/r/$1/*"
