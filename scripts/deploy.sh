#!/usr/bin/env bash
set -e

SSH_REPO="git@github.com:nomadeducation/kane-docs-build.git"
SHA=`git rev-parse --verify HEAD`
TARGET_BRANCH="master"

echo "deploying changes"
git init

git config user.name "Travis CI"
git config user.email "developer+travis@nomadeducation.fr"

git add --force index.html bundle.js css/
git commit -m "Deploy to GitHub Pages: ${SHA}"

chmod 600 deploy_key
eval `ssh-agent -s`
ssh-add deploy_key

git push --force $SSH_REPO $TARGET_BRANCH