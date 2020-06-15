#!/bin/bash

MAILTO="<email_addresses>|ex:admin@foobar.com"
SITENAME="<server_host_name>|ex:foobar"
DIR_INSTALL="<path_to_solr_check|ex:/home/john>"
LOG_FILE="solr_check.log"
PATH_TO_PHP="<path_to_php|ex:/usr/bin/php>"

cd  $DIR_INSTALL
if  $PATH_TO_PHP $DIR_INSTALL/solr_service.php | grep -q  'Down';  then
        service solr start > $LOG_FILE
        mutt -s "$HOSTNAME: SORL service restarted" $MAILTO -a $LOG_FILE
else
    echo "SOLR runnning." > $LOG_FILE
fi
