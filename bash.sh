#!/bin/bash

#

# Push the current branch to origin, set upstream, open the PR page if possible.
 gpr() {

    #  git checkout -b PR-"$JOB_NAME/$BUILD_NUMBER"
    #  git checkout -b PR
#     # Get the current branch name, or use 'HEAD' if we cannot get it.
     branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
    
    echo $branch
#     # Pushing take a little while, so let the user know we're working.
     git add .
    
    msg="generate by shmok ventil"
     git commit -m "$msg"
#     # Push to origin, grabbing the output but then echoing it back.
     
     push_output=`git push origin -u ${branch} 2>&1`

    #   pr_url=https://github.com/israelfrank/bash/compare/main...$branch

    # open $pr_url
       curl \
        -H "Accept: application/vnd.github.v3+json" \
        https://api.github.com/repos/octocat/israelfrank/bash \
        -d "{\"title\":\"$msg\",\"base\":\"main\",\"head\":\"$branch\"}" \
        | jq -r '.html_url'
    }

    gpr



# pull_request() {
#   to_branch=$1
#   if [ -z $to_branch ]; then
#     to_branch="main"
#   fi
  
#   # try the upstream branch if possible, otherwise origin will do
#   upstream=$(git config --get remote.upstream.url)
#   origin=$(git config --get remote.origin.url)
#   if [ -z $upstream ]; then
#     upstream=$origin
#   fi
  
#   to_user=$(echo $upstream | sed -e 's/.*[\/:]\([^/]*\)\/[^/]*$/\1/')
#   from_user=$(echo $origin | sed -e 's/.*[\/:]\([^/]*\)\/[^/]*$/\1/')
#   repo=$(basename `git rev-parse --show-toplevel`)
#   from_branch=$(git rev-parse --abbrev-ref HEAD)
#   open "https://github.com/$to_user/$repo/pull/new/$to_user:$to_branch...$from_user:$from_branch"
# }
 
# # usage
# pull_request   