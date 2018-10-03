# jboss image as the base
FROM jboss/base-jdk:8

ENV WILDFLY_USER user1
ENV WILDFLY_PASSWORD password1
ENV WILDFLY_HOME /opt/jboss/wildfly
ENV KEYPATH /opt/certificates/javakeystore.jks


USER root

RUN cd $HOME \
&& curl -O https://download.jboss.org/wildfly/14.0.0.Final/wildfly-14.0.0.Final.tar.gz \
&& tar xf wildfly-14.0.0.Final.tar.gz \
&& mv $HOME/wildfly-14.0.0.Final $WILDFLY_HOME \
&& rm wildfly-14.0.0.Final.tar.gz \
&& chown -R jboss:0 ${WILDFLY_HOME} \
&& chmod -R g+rw ${WILDFLY_HOME}

USER jboss

COPY entry.sh /

EXPOSE 80
EXPOSE 443

ENTRYPOINT ["/entry.sh"]











