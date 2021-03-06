{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "spring-petclinic.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "spring-petclinic.fullname" -}}
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
{{- define "spring-petclinic.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "spring-petclinic.labels" -}}
app.kubernetes.io/name: {{ include "spring-petclinic.name" . }}
helm.sh/chart: {{ include "spring-petclinic.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "spring-petclinic.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "spring-petclinic.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Create an image reference
*/}}
{{- define "registryImage" -}}
    {{ $registry := default .global.imageRegistry .image.registry }}
    {{- printf "%s/%s:%s" $registry .image.name .image.tag -}}
    {{- if .image.digest -}}
        {{- printf "@%s" .image.digest -}}
    {{- end -}}
{{- end -}}

{{/*
Specify the image pull policy
*/}}
{{- define "imagePullPolicy" -}}
    {{- printf "%s" (default .global.imagePullPolicy .image.pullPolicy) -}}
{{- end -}}

{{/*
Use the image pull secrets
*/}}
{{- define "imagePullSecrets" -}}
    {{- $secrets := default .global.imagePullSecrets .image.pullSecrets -}}
    {{- if $secrets -}}
        imagePullSecrets:
        {{- range $secrets }}
            - name: {{ . }}
        {{- end }}
    {{- end -}}
{{- end -}}
