#!/bin/bash -e

eval $(ssh-agent -s)

gpg-import.sh

debsign -S

ssh-import.sh

# dput ppa:${INPUT_PPA}
