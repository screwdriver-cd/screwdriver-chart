#!/bin/bash -e

if grep -q "{{" example-scm-settings.json; then
  echo Please configure example-scm-settings.json with real value!
  exit 1
fi

cp screwdriver-api-secrets.tmpl screwdriver-api-secrets.yaml

for name in '{{cookiepassword}}' '{{encryptionpassword}}' '{{hashingpassword}}'; do
  value=$(cat /dev/urandom | env LC_CTYPE=C tr -dc a-zA-Z0-9 | head -c 32 | base64)
  sed -i.bak "s/$name/$value/g" screwdriver-api-secrets.yaml
done

for target in 'api' 'queue'; do
  openssl genrsa -out "${target}-jwt.pem" 2048
  openssl rsa -in "${target}-jwt.pem" -pubout -out "${target}-jwt.pub"

  privatekey=$(cat "${target}-jwt.pem" | base64 | tr -d '\n')
  publickey=$(cat "${target}-jwt.pub" | base64 | tr -d '\n')

  sed -i.bak "s/{{${target}-jwtpublickey}}/$publickey/g" screwdriver-api-secrets.yaml
  sed -i.bak "s/{{${target}-jwtprivatekey}}/$privatekey/g" screwdriver-api-secrets.yaml
done

scmsettings=$(cat example-scm-settings.json | base64 | tr -d '\n')
sed -i.bak "s/{{scmsettings}}/$scmsettings/g" screwdriver-api-secrets.yaml

rm screwdriver-api-secrets.yaml.bak
