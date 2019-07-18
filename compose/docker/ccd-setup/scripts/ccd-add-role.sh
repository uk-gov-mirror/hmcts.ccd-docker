#!/bin/sh
## Usage: ./ccd-add-role.sh role [classification]
##
## Options:
##    - role: Name of the role. Must be an existing IDAM role.
##    - classification: Classification granted to the role; one of `PUBLIC`,
##        `PRIVATE` or `RESTRICTED`. Default to `PUBLIC`.
##
## Add support for an IDAM role in CCD.

role=$1
classification=${2:-PUBLIC}

if [ -z "$role" ]
  then
    echo "Usage: ./ccd-add-role.sh role [classification]"
    exit 1
fi

case $classification in
  PUBLIC|PRIVATE|RESTRICTED)
    ;;
  *)
    echo "Classification must be one of: PUBLIC, PRIVATE or RESTRICTED"
    exit 1 ;;
esac

userToken="$(./idam-user-token.sh)"
serviceToken="$(./idam-service-token.sh ccd_gw)"

echo $userToken

echo $serviceToken


curl -v --request XPUT \
  --url http://ccd-definition-store-api:4451/api/user-role \
  --header "Authorization: Bearer ${userToken}" \
  --header "ServiceAuthorization: Bearer ${serviceToken}" \
  --header "Content-Type: application/json" \
  --data '{"role":"'${role}'","security_classification":"'${classification}'"}'
