#!/bin/bash

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=us-east-1
data=$(cat $GITHUB_EVENT_PATH)
data=$(echo $data| jq .pull_request.head.repo.clone_url | tr -d '"')
git config --global user.name "sahilchilana"
git config --global user.email "sahilchilana@gmail.com"
git clone $data forked-repo
cd forked-repo
git checkout template
ls
