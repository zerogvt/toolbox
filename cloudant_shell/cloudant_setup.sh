#!/usr/bin/env bash
export CLOUDANT_API_KEY=$1
export CLOUDANT_URL=$2

alias acurl='curl -k -X GET -H "Content-type: application/json" -H "Authorization: '"$CLOUDANT_TOKEN"'" '

TOKEN=$(curl -s -k -X POST \
  --header "Content-Type: application/x-www-form-urlencoded" \
  --header "Accept: application/json" \
  --data-urlencode "grant_type=urn:ibm:params:oauth:grant-type:apikey" \
  --data-urlencode "apikey=${CLOUDANT_API_KEY}" \
  "https://iam.cloud.ibm.com/identity/token" | jq '.access_token' | tr -d '"')

export CLOUDANT_TOKEN="Bearer $TOKEN"
