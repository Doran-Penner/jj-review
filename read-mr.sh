#!/usr/bin/env sh

jj bookmark list --sort name- --all-remotes | rg "c/r/.+/v[^:]+" --only-matching
