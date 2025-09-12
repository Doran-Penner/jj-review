#!/usr/bin/env sh

# WIP these are just some useful commands
jj bookmark list --sort name | rg "prop/merge/.+/v[^:]+" --only-matching
