#!/bin/bash

if grep -q "{{" example-scm-settings.json; then
  echo Please configure example-scm-settings.json with real value!
  exit 1
fi

cp screwdriver-api-secrets.tmpl screwdriver-api-secrets.yaml

for name in '{{cookiepassword}}' '{{encryptionpassword}}' '{{hashingpassword}}'
do
    value=`cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 32 | base64`
    sed -i.bak "s/$name/$value/g" screwdriver-api-secrets.yaml
done

openssl genrsa -out jwt.pem 2048
openssl rsa -in jwt.pem -pubout -out jwt.pub

privatekey=`cat jwt.pem | base64 | tr -d '\n'`
publickey=`cat jwt.pub | base64 | tr -d '\n'`

sed -i.bak "s/{{jwtpublickey}}/$publickey/g" screwdriver-api-secrets.yaml
sed -i.bak "s/{{jwtprivatekey}}/$privatekey/g" screwdriver-api-secrets.yaml

scmsettings=`cat example-scm-settings.json | base64 | tr -d '\n'`
sed -i.bak "s/{{scmsettings}}/$scmsettings/g" screwdriver-api-secrets.yaml

rm screwdriver-api-secrets.yaml.bak
