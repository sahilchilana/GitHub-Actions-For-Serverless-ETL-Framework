#!/bin/bash

execution_name=$(date)
execution_name=(${execution_name// /_})
execution_name=(${execution_name//:/-})

arn_value=$(aws cloudformation describe-stack-resources --stack-name serverlessetlframeworkteststack)
arn_value=$(echo $arn_value |jq '.StackResources[] | select(.ResourceType == "AWS::StepFunctions::StateMachine").PhysicalResourceId' | tr -d '"')

execution_arn=$(aws stepfunctions start-execution --state-machine $arn_value --name $execution_name| jq .executionArn | tr -d '"')

sleep 30s

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
