docker rm keycloak
docker run --name keycloak \
-p 8080:8080 -p 8443:8443 \
-e MYSQL_DATABASE=keycloak \
-e MYSQL_USERNAME=keycloak \
-e MYSQL_PORT_3306_TCP_PORT=3307 \
-e MYSQL_PORT_3306_TCP_ADDR=192.168.2.13 \
-e MYSQL_PASSWORD=P@ssw0rD \
carljmosca/keycloak-mysql
