#!/bin/bash

export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY
export AWS_DEFAULT_REGION=us-east-1
git branch
ls
python send_email.py
python requests_github.py
sam validate --template /github/workspace/test_template.yaml
cd ServerlessETLFramework/vocabularies/<vocabulary-name>/Scrapper
python scrapper.py
echo "Success!!!"
