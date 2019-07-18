#!/bin/sh

IMPORTER_USERNAME=${1:-ccd.docker.default@hmcts.net}
IMPORTER_PASSWORD=${2:-Pa55word11}
IDAM_URI="http://sidam-api:5000"
REDIRECT_URI="http://localhost:3451/oauth2redirect"
CLIENT_ID="ccd_gateway"
CLIENT_SECRET="ccd_gateway_secret"

authToken=$(curl -H 'Content-Type: application/x-www-form-urlencoded' -XPOST "${IDAM_URI}/loginUser?username=idamOwner@hmcts.net&password=Ref0rmIsFun" | jq -r .api_auth_token)

#Create a ccd gateway client
curl --request POST \
--url ${IDAM_URI}/services \
--header "Authorization: AdminApiAuthToken ${authToken}" \
--header 'Content-Type: application/json' \
--data '{ "activationRedirectUrl": "", "allowedRoles": ["ccd-import","caseworker","caseworker-autotest1","caseworker-autotest2" ], "description": "ccd_gateway", "label": "ccd_gateway", "oauth2ClientId": "ccd_gateway", "oauth2ClientSecret": "ccd_gateway_secret", "oauth2RedirectUris": ["http://localhost:3451/oauth2redirect" ], "oauth2Scope": "string", "onboardingEndpoint": "string", "onboardingRoles": ["ccd-import","caseworker","caseworker-autotest1","caseworker-autotest2" ], "selfRegistrationAllowed": true}'

#Create all the role
source /idam-role.sh ccd_import
source /idam-role.sh caseworker
source /idam-role.sh caseworker-autotest1
source /idam-role.sh caseworker-autotest2

#Assign all the roles to the ccd_gateway client
curl --request PUT --compressed \
--url ${IDAM_URI}/services/ccd_gateway/roles \
--header "Authorization: AdminApiAuthToken ${authToken}" \
--header 'Content-Type: application/json' \
--data-binary '["ccd_import", "caseworker", "caseworker-autotest1", "caseworker-autotest2"]'

