{{/* vim: set filetype=mustache: */}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "fuck-russia.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "fuck-russia.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "fuck-russia.labels" -}}
helm.sh/chart: {{ include "fuck-russia.chart" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
team: {{ .Values.global.team }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "fuck-russia.serviceAccountName" -}}
    {{ default (include "fuck-russia.fullname" .) .Values.serviceAccount.nameOverride }}
{{- end -}}

{{/*
Default resources
*/}}
{{- define "resources" -}}
limits:
  cpu: 1
  memory: 1024Mi
requests:
  cpu: 200m
  memory: 128Mi
{{- end -}}