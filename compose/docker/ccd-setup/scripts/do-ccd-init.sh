#!/bin/sh

##This script will create the user roles.

echo \n"###################################"
echo "      Creating test caseworkers"
echo "#####################################"

#Case workers are being created in SIDAM
/bin/bash /idam-create-caseworker.sh caseworker,ccd-import ccd.docker.default@hmcts.net Pa55word11 DockerImporter DockerImporter
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,ccd-import auto.test.cnp@gmail.com Pa55word11 testsurname testfirstname
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,ccd-import auto.test.cnp+fe@gmail.com Pa55word11 testsurname testfirstname
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,ccd-import auto.ccd.fe@gmail.com Pa55word11 testsurname testfirstname
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,caseworker-autotest1-private auto.test.cnp+private@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,caseworker-autotest1-senior auto.test.cnp+senior@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,caseworker-autotest1-solicitor auto.test.cnp+solc@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest2 auto.test2.cnp@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest2,caseworker-autotest2-private auto.test2.cnp+private@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest2,caseworker-autotest2-senior auto.test2.cnp+senior@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest2,caseworker-autotest2-solicitor auto.test2.cnp+solc@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,caseworker-autotest2 auto.test12.cnp@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,caseworker-autotest1-private,caseworker-autotest2,caseworker-autotest2-private auto.test12.cnp+private@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,caseworker-autotest1-solicitor,caseworker-autotest2,caseworker-autotest2-solicitor auto.test12.cnp+solc@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,caseworker-autotest1-senior,caseworker-autotest2,caseworker-autotest2-senior auto.test12.cnp+senior@gmail.com Pa55word11
/bin/bash /idam-create-caseworker.sh caseworker,caseworker-autotest1,caseworker-autotest1-senior ccdimportdomain@gmail.com Pa55word11

echo "##########################################"
echo "      Creating test ccd caseworker roles  "
echo "##########################################"

#Roles are being created in Definition store
source /ccd-add-role.sh ccd-import PUBLIC
source /ccd-add-role.sh caseworker PUBLIC
source /ccd-add-role.sh caseworker-autotest1 PUBLIC
source /ccd-add-role.sh caseworker-autotest2 PUBLIC
source /ccd-add-role.sh caseworker-autotest1-private PRIVATE
source /ccd-add-role.sh caseworker-autotest1-senior RESTRICTED
source /ccd-add-role.sh caseworker-autotest1-solicitor PRIVATE
source /ccd-add-role.sh caseworker-autotest2 PUBLIC
source /ccd-add-role.sh caseworker-autotest2-private PRIVATE
source /ccd-add-role.sh caseworker-autotest2-senior RESTRICTED
source /ccd-add-role.sh caseworker-autotest2-solicitor PRIVATE
