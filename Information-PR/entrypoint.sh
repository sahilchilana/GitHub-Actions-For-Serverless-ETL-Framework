#!/bin/bash

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=us-east-1

python send_email.py

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
sam deploy --stack-name serverlessetlframeworkteststack --capablities CAPABLITY_IAM --template-file out.yml

execution_name=$(date)
execution_name=(${execution_name// /_})
execution_name=(${execution_name//:/-})

arn_value=$(aws cloudformation describe-stack-resources --stack-name serverlessetlframeworkteststack)
arn_value=$(echo $arn_value |jq '.StackResources[] | select(.ResourceType == "AWS::StepFunctions::StateMachine").PhysicalResourceId' | tr -d '"')

execution_arn=$(aws stepfunctions start-execution --state-machine $arn_value --name $execution_name --input "{\"number1\":10, \"number2\":20}"| jq .executionArn | tr -d '"')

sleep 10s

outpt=$(aws stepfunctions describe-execution --execution-arn $execution_arn)
output=$(echo $output| jq .status| tr -d '"')

echo "Output='$output'"
if [ "$output" == "SUCCEEDED" ]; then
  echo "Test Passed"
  python send_email.py $output

else
  echo "Test Failed"
  python send_email.py $output

fi
