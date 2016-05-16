#!/bin/bash

rm -f keycloak.jks

function genkey {
  keytool -genkey -noprompt \
    -alias keycloak-$1 \
    -dname "CN=$1, OU=Carl, O=Mosca, L=Richmond, S=Virginia, C=US" \
    -keyalg RSA \
    -keystore keycloak.jks \
    -storepass secret \
    -keypass secret \
    -validity 10950
}

genkey auth.moscaville.com
