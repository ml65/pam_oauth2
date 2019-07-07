#!/bin/sh

# Replace parameters for you server ant test request for Oauth2 server

curl -X "POST" "https://oauth2serverurl" \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -H "Accept: 1.0" \
    --data-urlencode "grant_type=password" \
    --data-urlencode "client_id=clientid" \
    --data-urlencode "username=login" \
    --data-urlencode "password=password" \
    --data-urlencode "scope=scope"

