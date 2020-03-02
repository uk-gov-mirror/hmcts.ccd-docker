#!/bin/sh
##Create all the roles
./bin/idam-client-setup-roles.sh

##Set up client services
./bin/idam-client-setup-service.sh divorce dummysecret
./bin/idam-client-setup-service.sh ccd_gateway ccd_gateway_secret




