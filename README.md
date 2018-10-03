## Introduction

This chart bootstraps the whole screwdriver ecosystem and also nginx ingress controller.

## Prerequisites

- Kubernetes 1.6+

## Installing the chart:
Please set up the following K8S secrets before installing the chart:
- screwdriver-api-{{ .Value.env }}-secrets
- screwdriver-store-{{ .Value.env }}-secrets

An example secret file `example-screwdriver-api-secrets.yaml` is provided. Run `generate_secret.sh` to generate secrets that can be auto-generated, the rest still need to be added manually.

```bash
$ bash generate_secrets.sh
# replace name and namespace with what you specify in values.yaml
$ kubectl apply -f screwdriver-api-secrets.yaml
```

After cloning the repo, to install the chart :

```bash
$ helm install ./screwdriver-chart
```
