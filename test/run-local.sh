#!/bin/bash -e

workspace=$1

warn() {
  echo 1>&2 "$@"
}

error() {
  warn "$@"
  exit 1
}

[ "$workspace" ] || error "Usage: $0 <workspace>"

[ "$INPUT_PPA" ] || error "Missing environment property: INPUT_PPA"
[ "$INPUT_GPG_KEY" ] || error "Missing environment property: INPUT_GPG_KEY"
[ "$INPUT_GPG_PASS" ] || warn "Missing environment property: INPUT_GPG_PASS"
[ "$INPUT_SSH_KEY" ] || error "Missing environment property: INPUT_SSH_KEY"
[ "$INPUT_SSH_PASS" ] || warn "Missing environment property: INPUT_SSH_PASS"

image='debsign-action:latest'
dir="$(dirname $0)/.."

docker build -t "$image" "$dir"

docker run --rm --workdir "/workspace" \
  -v "$workspace":"/workspace" \
  -e "INPUT_PPA" \
  -e "INPUT_GPG_KEY" \
  -e "INPUT_GPG_PASS" \
  -e "INPUT_SSH_KEY" \
  -e "INPUT_SSH_PASS" \
  "$image"
