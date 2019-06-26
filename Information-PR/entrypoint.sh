#!/bin/bash
python requests_github.py

git config --global user.email "$GH_EMAIL"
git config --global user.name "$GH_USER"

git add test_template.yaml
git commit -m "Created test sam template for new additions"
git push origin develop

echo "Success!!!"
