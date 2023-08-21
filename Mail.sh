#!/bin/bash

TO_ADDRESS=$1
SUBJECT=$2
BODY=$(sed -e 's/[\/&]/\\&/g' <<< $3)
echo "escaped content : $BODY"
ALERT_TYPE=$4
MESSAGE=$5

#echo $BODY | mail -s $SUBJECT $TO_ADDRESS

FINAL_BODY=$(sed -e 's/Team_name/DevOps Team/g' -e 's/alert/High Disk alert/g' -e "s/Message/$BODY/" MailTemplate.html)