FROM jboss/keycloak-mysql:1.7.0.Final

MAINTAINER Carl J. Mosca <carljmosca@gmail.com>

ENV JBOSS_HOME /opt/jboss/keycloak

# setup SSL
USER root
ADD keycloak.jks $JBOSS_HOME/standalone/configuration/
RUN chown jboss:jboss $JBOSS_HOME/standalone/configuration/keycloak.jks
USER jboss
RUN sed -i -e 's/<security-realms>/&\n            <security-realm name="UndertowRealm">\n                <server-identities>\n                    <ssl>\n                        <keystore path="keycloak.jks" relative-to="jboss.server.config.dir" keystore-password="secret" \/>\n                    <\/ssl>\n                <\/server-identities>\n            <\/security-realm>/' $JBOSS_HOME/standalone/configuration/standalone.xml
RUN sed -i -e 's/<server name="default-server">/&\n                <https-listener name="https" socket-binding="https" security-realm="UndertowRealm"\/>/' $JBOSS_HOME/standalone/configuration/standalone.xml
