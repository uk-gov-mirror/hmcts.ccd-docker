#!/bin/sh

IMPORTER_USERNAME=${1:-ccd.docker.default@hmcts.net}
IMPORTER_PASSWORD=${2:-Pa55word11}
IDAM_URI="http://localhost:5000"
REDIRECT_URI="http://localhost:3451/oauth2redirect"
CLIENT_ID="ccd_gateway"
CLIENT_SECRET="ccd_gateway_secret"

authToken=$(curl -v -H 'Content-Type: application/x-www-form-urlencoded' -XPOST "${IDAM_URI}/loginUser?username=idamOwner@hmcts.net&password=Ref0rmIsFun" | jq -r .api_auth_token)

echo "authtoken is ${authToken}"

#Create a ccd gateway client
curl -XPOST \
  ${IDAM_URI}/services \
 -H "Authorization: AdminApiAuthToken ${authToken}" \
 -H "Content-Type: application/json" \
 -d '{ "activationRedirectUrl": "", "allowedRoles": ["ccd-import", "caseworker", "caseworker-divorce-courtadmin-la", "caseworker-divorce", "caseworker-divorce-superuser", "caseworker-divorce-courtadmin", "caseworker-divorce-solicitor", "caseworker-divorce-courtadmin_beta", "caseworker-bulkscan", "caseworker-divorce-systemupdate", "caseworker-divorce-bulkscan", "payment"], "description": "ccd_gateway", "label": "ccd_gateway", "oauth2ClientId": "ccd_gateway", "oauth2ClientSecret": "ccd_gateway_secret", "oauth2RedirectUris": ["http://localhost:3451/oauth2redirect", "http://localhost:3000/oauth2/callback", "https://localhost:3000/authenticated" ], "oauth2Scope": "string", "onboardingEndpoint": "string", "onboardingRoles": ["ccd-import", "caseworker", "caseworker-divorce-courtadmin-la", "caseworker-divorce", "caseworker-divorce-superuser", "caseworker-divorce-courtadmin", "caseworker-divorce-solicitor", "caseworker-divorce-courtadmin_beta", "caseworker-bulkscan", "caseworker-divorce-systemupdate", "caseworker-divorce-bulkscan", "payment"], "selfRegistrationAllowed": true}'

#Create all the role
./bin/idam-role.sh caseworker
./bin/idam-role.sh caseworker-divorce-courtadmin-la
./bin/idam-role.sh caseworker-divorce
./bin/idam-role.sh caseworker-divorce-superuser
./bin/idam-role.sh caseworker-divorce-courtadmin
./bin/idam-role.sh caseworker-divorce-solicitor
./bin/idam-role.sh caseworker-divorce-courtadmin_beta
./bin/idam-role.sh caseworker-bulkscan
./bin/idam-role.sh caseworker-divorce-systemupdate
./bin/idam-role.sh caseworker-divorce-bulkscan
./bin/idam-role.sh payment
./bin/idam-role-assignable.sh ccd-import

#Assign all the roles to the ccd_gateway client
curl -XPUT \
  ${IDAM_URI}/services/ccd_gateway/roles \
 -H "Authorization: AdminApiAuthToken ${authToken}" \
 -H "Content-Type: application/json" \
 -d '["ccd-import", "caseworker", "caseworker-divorce-courtadmin-la", "caseworker-divorce", "caseworker-divorce-superuser", "caseworker-divorce-courtadmin", "caseworker-divorce-solicitor", "caseworker-divorce-courtadmin_beta", "caseworker-bulkscan", "caseworker-divorce-systemupdate", "caseworker-divorce-bulkscan", "payment"]'

