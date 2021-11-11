{{/*
Expand the name of the chart.
*/}}
{{- define "elasticsearch.name" -}}
{{- printf "%s-%s" (default .Chart.Name .Values.nameOverride) .Values.environment | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "elasticsearch.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := printf "%s-%s" (default .Chart.Name .Values.nameOverride) .Values.environment }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "elasticsearch.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "elasticsearch.labels" -}}
helm.sh/chart: {{ include "elasticsearch.chart" . }}
{{ include "elasticsearch.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "elasticsearch.selectorLabels" -}}
app.kubernetes.io/name: {{ include "elasticsearch.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Client labels
*/}}
{{- define "elasticsearch.clientLabels" -}}
{{- if and (eq (len .) 1) (or (eq (index . 0) "master") (eq (index . 0) "ingest"))}}
elasticsearch/client-eligible: "false"
{{- else }}
{{- include "elasticsearch.clientSelectorLabels" . }}
{{- end }}
{{- end }}

{{/*
Client selector labels
*/}}
{{- define "elasticsearch.clientSelectorLabels" -}}
elasticsearch/client-eligible: "true"
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "elasticsearch.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "elasticsearch.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
*/}}
{{- define "elasticsearch.joinMasterHosts" -}}
{{- $masterList := list -}}
{{- range $.Values.nodeSets }}
{{- if has "master" .roles }}
{{- $fullName := printf "%s-%s" (include "elasticsearch.fullname" $) .name -}}
{{- range $key, $val := until (.count | int) }}
{{- $masterList = printf "%s-%d" $fullName $val | append $masterList -}}
{{- end }}
{{- end }}
{{- end }}
{{- join "," $masterList | quote }}
{{- end }}

{{- define "elasticsearch.countMasterHosts" -}}
{{- $masterList := list -}}
{{- range $.Values.nodeSets }}
{{- if has "master" .roles }}
{{- $fullName := printf "%s-%s" (include "elasticsearch.fullname" $) .name -}}
{{- range $key, $val := until (.count | int) }}
{{- $masterList = printf "%s-%d" $fullName $val | append $masterList -}}
{{- end }}
{{- end }}
{{- end }}
{{- len $masterList }}
{{- end }}

{{/*
*/}}
{{- define "recurseFlattenMap" -}}
{{- $map := first . -}}
{{- $label := last . -}}
{{- range $key, $val := $map }}
  {{- $sublabel := list $label $key | join "." -}}
  {{- if kindOf $val | eq "map" }}
    {{- list $val $sublabel | include "recurseFlattenMap" }}
  {{- else }}
- name: {{ $sublabel }}
  value: {{ $val | quote }}
  {{- end }}
{{- end }}
{{- end }}
