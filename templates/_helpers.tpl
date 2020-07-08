{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "screwdriver.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "screwdriver.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a fully qualified Screwdriver's api name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "api.fullname" -}}
{{- if .Values.api.fullnameOverride -}}
{{- .Values.api.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.api.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified Screwdriver's ui name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ui.fullname" -}}
{{- if .Values.ui.fullnameOverride -}}
{{- .Values.ui.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.ui.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.ui.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified Screwdriver's store name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "store.fullname" -}}
{{- if .Values.store.fullnameOverride -}}
{{- .Values.store.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.store.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.store.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create a fully qualified Screwdriver's queue-service name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "queue.fullname" -}}
{{- if .Values.queue.fullnameOverride -}}
{{- .Values.queue.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf "%s-%s" .Release.Name .Values.queue.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s-%s" .Release.Name $name .Values.queue.name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create urls for api
*/}}
{{- define "api.uri" -}}
{{- if .Values.https -}}
{{- printf "https://%s%s" .Values.ingress.hosts.api .Values.ingress.singleHost.apiPath -}}
{{- else -}}
{{- printf "http://%s%s" .Values.ingress.hosts.api .Values.ingress.singleHost.apiPath -}}
{{- end -}}
{{- end -}}

{{/*
Create urls for ui
*/}}
{{- define "ui.uri" -}}
{{- if .Values.https -}}
{{- printf "https://%s%s" .Values.ingress.hosts.ui .Values.ingress.singleHost.uiPath -}}
{{- else -}}
{{- printf "http://%s%s" .Values.ingress.hosts.ui .Values.ingress.singleHost.uiPath -}}
{{- end -}}
{{- end -}}

{{/*
Create urls for store
*/}}
{{- define "store.uri" -}}
{{- if .Values.https -}}
{{- printf "https://%s%s" .Values.ingress.hosts.store .Values.ingress.singleHost.storePath -}}
{{- else -}}
{{- printf "http://%s%s" .Values.ingress.hosts.store .Values.ingress.singleHost.storePath -}}
{{- end -}}
{{- end -}}

{{/*
Create urls for queue-service
*/}}
{{- define "queue.uri" -}}
{{- if .Values.https -}}
{{- printf "https://%s%s" .Values.ingress.hosts.queue .Values.ingress.singleHost.queuePath -}}
{{- else -}}
{{- printf "http://%s%s" .Values.ingress.hosts.queue .Values.ingress.singleHost.queuePath -}}
{{- end -}}
{{- end -}}

{{/*
  Determine the hostname to use for postgresql
*/}}
{{- define "postgresql.hostname" -}}
{{- if .Values.postgresql.enabled -}}
{{- printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s" .Values.postgresql.postgresServer -}}
{{- end -}}
{{- end -}}

{{/*
  Create a default fully qualified postgresql name.
  We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "postgresql.fullname" -}}
{{- printf "%s-%s" .Release.Name "postgresql" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
