#!/bin/bash

# Colour constants for nicer output.
GREEN='\033[0;32m'
RESET='\033[0m'

# Push the current branch to origin, set upstream, open the PR page if possible.
gpr() {

    git checkout PR || git checkout -b PR
    # Get the current branch name, or use 'HEAD' if we cannot get it.
    branch=${branch:-HEAD}

    # Pushing take a little while, so let the user know we're working.
    echo "Opening pull request for ${GREEN}${branch}${RESET}..."
    git add .
    git commit -m "ddaasd"
    # Push to origin, grabbing the output but then echoing it back.
    push_output=`git push origin -u ${branch} 2>&1`
    echo ""
    echo ${push_output}
}

gpr