#!/bin/sh

IMPORTER_USERNAME=${1:-idamOwner@hmcts.net}
IMPORTER_PASSWORD=${2:-Ref0rmIsFun}
IDAM_URI=${IDAM_STUB_LOCALHOST:-http://localhost:5000}
REDIRECT_URI="http://localhost:3451/oauth2redirect"
CLIENT_ID="ccd_gateway"
CLIENT_SECRET="ccd_gateway_secret"

code=$(
curl --silent --show-error -X POST "${IDAM_URI}/o/token" \
      -H "accept: application/json" \
      -H "Content-Type: application/x-www-form-urlencoded" \
      --data-urlencode "client_id=${CLIENT_ID}" \
      --data-urlencode "client_secret=${CLIENT_SECRET}" \
      --data-urlencode "grant_type=password" \
      --data-urlencode "username=${IMPORTER_USERNAME}" \
      --data-urlencode "password=${IMPORTER_PASSWORD}" \
      --data-urlencode "redirect_uri=${REDIRECT_URI}" \
      --data-urlencode "scope=openid roles profile manage-user" | jq -r .access_token)

echo "${code}"
