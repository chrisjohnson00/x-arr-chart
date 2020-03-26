#!/bin/bash
set -x

body='{
 "request": {
 "message": "Auto Triggered Rebuild",
 "branch":"master"
  }
}'

curl --fail -i -X POST \
 -H "Content-Type: application/json" \
 -H "Accept: application/json" \
 -H "Travis-API-Version: 3" \
 -H "Authorization: token $travis_token" \
 -d "$body" \
 https://api.travis-ci.com/repo/chrisjohnson00%2Fhelm-charts/requests
