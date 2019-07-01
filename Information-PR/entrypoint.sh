#!/bin/bash

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=us-east-1
data=$(cat $GITHUB_EVENT_PATH)
data1=$(echo $data| jq .pull_request.head.repo.clone_url| tr -d '"' | cut -b 1-8)
data2=$(echo $data| jq .pull_request.head.repo.clone_url| tr -d '"' | cut -b 9-)
data=$data1$PERSONAL_ACCESS_TOKEN$data2
git clone $data forked-repo
cd forked-repo
git checkout template
ls
