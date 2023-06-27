#!/bin/bash -e

eval $(ssh-agent -s)

gpg-import.sh

sign.sh -S

ssh-import.sh

# dput ppa:${INPUT_PPA}
