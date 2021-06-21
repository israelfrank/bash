#!/bin/bash

#

# Push the current branch to origin, set upstream, open the PR page if possible.
gpr() {

    git checkout PR1  || git checkout -b PR1
    # Get the current branch name, or use 'HEAD' if we cannot get it.
    git branch
    echo $branch
    # Pushing take a little while, so let the user know we're working.
    git add .
    git commit -m "ddaasd"
    # Push to origin, grabbing the output but then echoing it back.
    push_output=`git push origin -u ${branch} 2>&1`

    pr_url=https://github.com/israelfrank/bash/compare/main...$branch

open $pr_url

}

gpr