## Introduction

This chart bootstraps the whole screwdriver ecosystem and also nginx ingress controller.

## Prerequisites

- Kubernetes 1.6+

## Installing the chart:
Please set up the following K8S secrets before installing the chart:
- screwdriver-api-{{ .Values.env }}-secrets
- screwdriver-store-{{ .Values.env }}-secrets

An example secret template file `screwdriver-api-secrets.tmpl` is provided. Run `generate_secret.sh` to generate secrets that can be auto-generated, the rest still need to be added manually.

```bash
$ bash generate_secrets.sh
# replace name and namespace with what you specify in values.yaml
$ kubectl apply -f screwdriver-api-secrets.yaml
# create the secrets for store if you configure to use s3 for store
$ kubectl apply -f screwdriver-store-secrets.yaml
```

After cloning the repo, to install the chart :

```bash
$ helm dependency update
$ helm install . --name my-screwdriver --namespace your-namespace
# To delete everything
$ helm del --purge my-screwdriver
# To update the chart
$ helm upgrade my-screwdriver . --namespace your-namespace
```
