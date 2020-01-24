#!/bin/bash
binFolder=$(dirname "$0")

(${binFolder}/idam-create-caseworker.sh ccd-import ccd.docker.default@hmcts.net Pa55word11 Default CCD_Docker)

(${binFolder}/idam-create-caseworker.sh caseworker,caseworker-autotest1,ccd-import auto.test.cnp@gmail.com Pa55word11 testsurname testfirstname)
(${binFolder}/idam-create-caseworker.sh caseworker-divorce divorce_cw@hmcts.net)
(${binFolder}/idam-create-caseworker.sh caseworker,caseworker-divorce,caseworker-divorce-courtadmin divorce_as_caseworker_beta@mailinator.com)
(${binFolder}/idam-create-caseworker.sh caseworker,caseworker-divorce,caseworker-divorce-courtadmin divorce_as_caseworker_solicitor@mailinator.com)
(${binFolder}/idam-create-caseworker.sh caseworker,caseworker-divorce,caseworker-divorce-courtadmin divorce_as_caseworker_superuser@mailinator.com)
(${binFolder}/idam-create-caseworker.sh caseworker,caseworker-divorce,caseworker-divorce-courtadmin divorce_as_caseworker_la@mailinator.com)
(${binFolder}/idam-create-caseworker.sh caseworker,caseworker-divorce,caseworker-divorce-courtadmin divorce_as_caseworker_admin@mailinator.com)
(${binFolder}/idam-create-caseworker.sh caseworker,caseworker-divorce,caseworker-divorce-courtadmin divorce_respondent_solicitor@mailinator.com)
(${binFolder}/idam-create-caseworker.sh caseworker,caseworker-divorce,caseworker-divorce-courtadmin TEST_SOLICITOR@mailinator.com)
(${binFolder}/idam-create-caseworker.sh citizen testusername@test.com)

(${binFolder}/ccd-add-role.sh payment)
(${binFolder}/ccd-add-role.sh citizen)
(${binFolder}/ccd-add-role.sh caseworker)
(${binFolder}/ccd-add-role.sh caseworker-divorce-courtadmin-la)
(${binFolder}/ccd-add-role.sh caseworker-divorce-superuser)
(${binFolder}/ccd-add-role.sh caseworker-divorce-courtadmin)
(${binFolder}/ccd-add-role.sh caseworker-divorce-solicitor)
(${binFolder}/ccd-add-role.sh caseworker-divorce-courtadmin_beta)

(${binFolder}/ccd-add-role.sh caseworker-bulkscan)
(${binFolder}/ccd-add-role.sh caseworker-probate-caseadmin)
(${binFolder}/ccd-add-role.sh caseworker-divorce)
(${binFolder}/ccd-add-role.sh caseworker-divorce-systemupdate)

(${binFolder}/ccd-add-role.sh caseworker-divorce-bulkscan)


