#!/usr/bin/env sh

jj bookmark list --sort name- --all-remotes | rg "prop/merge/.+/v[^:]+" --only-matching
