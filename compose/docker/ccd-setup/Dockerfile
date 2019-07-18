FROM alpine:3.10

## Add the wait script to the image
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait

COPY scripts/* /

ADD https://github.com/hmcts/ccd-case-management-web/raw/master/test/resources/definitionsFiles/fe-automation-definition-v18_RDM-4891_Postcode_Lookup.xlsx /definitions.xlsx

RUN apk add --no-cache curl jq

RUN apk add --no-cache bash

RUN chmod +x /wait
RUN chmod +x definitions.xlsx
RUN chmod +x /*.sh

# CMD "/wait" && "/idam-client-setup.sh" && "/do-ccd-init.sh" && "/ccd-import-definition.sh" "definitions.xlsx"
CMD "/wait" && "/do-ccd-init.sh" && "/ccd-import-definition.sh" "definitions.xlsx"
