#!/bin/bash
set -e
trap 'last_command=$current_command; current_command=$BASH_COMMAND' DEBUG
trap 'echo "\"${last_command}\" command filed with exit code $?."' EXIT
ln -s $KEYPATH $WILDFLY_HOME/standalone/configuration/certificates.jks 
$WILDFLY_HOME/bin/add-user.sh $WILDFLY_USER $WILDFLY_PASSWORD
$WILDFLY_HOME/bin/add-user.sh -a $WILDFLY_USER $WILDFLY_PASSWORD
$WILDFLY_HOME/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 $@







