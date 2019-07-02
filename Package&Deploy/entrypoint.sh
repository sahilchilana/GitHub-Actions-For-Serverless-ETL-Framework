#!/bin/bash

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=us-east-1

python send_pr_email.py

data=$(cat $GITHUB_EVENT_PATH)
data1=$(echo $data| jq .pull_request.head.repo.clone_url| tr -d '"' | cut -b 1-8)
data2=$(echo $data| jq .pull_request.head.repo.clone_url| tr -d '"' | cut -b 9-)
data=$data1'sahilchilana:'$PASSWORD_GITHUB'@'$data2

git clone $data forked-repo
cd forked-repo
git checkout template

python requests_github.py
output=$(sam validate -t test_template.yaml)
echo $output

if [[ $output == *"was invalid"* ]]; then
  exit 1
fi

sam package --template-file test_template.yaml --output-template-file out.yml --s3-bucket serverlessetlframeworktestbucket
sam deploy --stack-name serverlessetlframeworkteststack6 --capabilities CAPABILITY_IAM --template-file out.yml
