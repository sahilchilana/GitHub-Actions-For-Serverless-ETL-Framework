#!/bin/bash


git config --global user.email "sahilchilana@gmail.com"
git config --global user.name "sahilchilana"
git checkout develop
python send_email.py
python requests_github.py
sam validate --template /github/workspace/test_template.yaml
echo "Success!!!"
