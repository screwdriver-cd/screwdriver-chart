#!/bin/bash

cp screwdriver-api-secrets.tmpl screwdriver-api-secrets.yaml

for name in '{{cookiepassword}}' '{{encryptionpassword}}' '{{hashingpassword}}'
do
    value=`cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 32 | base64`
    sed -i.bak "s/$name/$value/g" screwdriver-api-secrets.yaml
done

openssl genrsa -out jwt.pem 2048
openssl rsa -in jwt.pem -pubout -out jwt.pub

privatekey=`cat jwt.pem | base64`
publickey=`cat jwt.pub | base64`

sed -i.bak "s/{{jwtpublickey}}/$publickey/g" screwdriver-api-secrets.yaml
sed -i.bak "s/{{jwtprivatekey}}/$privatekey/g" screwdriver-api-secrets.yaml

rm screwdriver-api-secrets.yaml.bak
