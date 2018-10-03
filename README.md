## Introduction

This chart bootstraps the whole screwdriver ecosystem and also nginx ingress controller.

## Prerequisites

- Kubernetes 1.6+

## Installing the chart:
Please set up the following secrets before installing the chart:
- screwdriver-api-{{ .Value.env }}secrets
- screwdriver-store-{{ .Value.env }}secrets

After cloning the repo, to install the chart :

```bash
$ helm install ./screwdriver-chart
```
