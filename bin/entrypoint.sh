#!/bin/bash -e

eval $(ssh-agent -s)

gpg-import.sh

# debsign

ssh-import.sh

# dput ppa:${INPUT_PPA}
