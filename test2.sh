#!/bin/sh

# replace parameters for your reply of access token from test1.sh request and parameters of URL of your Oauth2 server
curl -X "GET" "https://oauth2ServerURL" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -H "Accept: 1.0" \
    -H "AUTHORIZATION: Bearer xxxxxxxxxxxxxxxxxx"

