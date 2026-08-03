{{- /* Helpers for ecommerce chart */ -}}
{{- define "ecommerce.name" -}}
{{- default .Chart.Name .Values.nameOverride -}}
{{- end -}}

{{- define "ecommerce.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "ecommerce.labels" -}}
app.kubernetes.io/name: {{ include "ecommerce.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
