#!/bin/bash

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=us-east-1
git config --global user.email "sahilchilana@gmail.com"
git config --global user.name "sahilchilana"
git checkout develop
python send_email.py
python requests_github.py
sam validate --template /github/workspace/test_template.yaml
echo "Success!!!"
