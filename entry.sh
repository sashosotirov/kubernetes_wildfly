#!/bin/bash
ln -s $KEYPATH $WILDFLY_HOME/standalone/configuration/certificates.jks 
$WILDFLY_HOME/bin/add-user.sh $WILDFLY_USER $WILDFLY_PASSWORD
$WILDFLY_HOME/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0 -Dsun.jnu.encoding=UTF-8 -Dfile.encoding=UTF-8 $@






