{{/*
Expand the name of the chart.
*/}}
{{- define "optimizer-chart.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "optimizer-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" $name .Release.Name  | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{- define "optimizer-chart.ui.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 60 | trimSuffix "-" | printf "%s-ui" . }}
{{- else }}
{{- printf "%s-%s" $name .Release.Name  | trunc 60 | trimSuffix "-" | printf "%s-ui" . }}
{{- end }}
{{- end }}
{{- end }}


{{- define "optimizer-ui.confName" -}}
{{- $name := default .Chart.Name .Values.uiConfNameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 55 | trimSuffix "-" | printf "%s-ui-conf" . }}
{{- else }}
{{- $uiConfName := printf "%s-%s" $name .Release.Name  | trunc 55 | trimSuffix "-" }}
{{- printf "%s-ui-conf" $uiConfName }}
{{- end }}
{{- end }}

{{- define "optimizer.confName" -}}
{{- $name := default .Chart.Name .Values.ConfNameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 58 | trimSuffix "-" | printf "%s-conf" . }}
{{- else }}
{{- $confName := printf "%s-%s" $name .Release.Name  | trunc 58 | trimSuffix "-" }}
{{- printf "%s-conf" $confName }}
{{- end }}
{{- end }}

{{- define "optimizer.svcName" -}}
{{- $name := default .Chart.Name .Values.ConfNameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 58 | trimSuffix "-" | printf "%s-svc" . }}
{{- else }}
{{- $confName := printf "%s-%s" $name .Release.Name  | trunc 58 | trimSuffix "-" }}
{{- printf "%s-svc" $confName }}
{{- end }}
{{- end }}

{{- define "optimizerDB.name" -}}
{{- $name := default .Chart.Name .Values.ConfNameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 51 | trimSuffix "-" | printf "%s-optimizerdb" . }}
{{- else }}
{{- $confName := printf "%s-%s" $name .Release.Name  | trunc 51 | trimSuffix "-" }}
{{- printf "%s-optimizerdb" $confName }}
{{- end }}
{{- end }}

{{- define "optimizerDB.svcName" -}}
{{- $name := default .Chart.Name .Values.ConfNameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 47 | trimSuffix "-" | printf "%s-optimizerdb-svc" . }}
{{- else }}
{{- $confName := printf "%s-%s" $name .Release.Name  | trunc 47 | trimSuffix "-" }}
{{- printf "%s-optimizerdb-svc" $confName }}
{{- end }}
{{- end }}

{{- define "optimizerDB.pvcName" -}}
{{- $name := default .Chart.Name .Values.ConfNameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 47 | trimSuffix "-" | printf "%s-optimizerdb-pvc" . }}
{{- else }}
{{- $confName := printf "%s-%s" $name .Release.Name  | trunc 47 | trimSuffix "-" }}
{{- printf "%s-optimizerdb-pvc" $confName }}
{{- end }}
{{- end }}

{{- define "optimizerDB.pvName" -}}
{{- $name := default .Chart.Name .Values.ConfNameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 48 | trimSuffix "-" | printf "%s-optimizerdb-pv" . }}
{{- else }}
{{- $confName := printf "%s-%s" $name .Release.Name  | trunc 48 | trimSuffix "-" }}
{{- printf "%s-optimizerdb-pv" $confName }}
{{- end }}
{{- end }}

{{/*#"optimizer:Optimizer~@tcp(127.0.0.1:3306)/optimizer?charset=utf8mb4&parseTime=true&loc=Local"*/}}

{{- define "optimizedb.conf.datasource" -}}
{{- $name := default "optimizer" .Values.optimizedb.conf.user }}
{{- $password := default "Optimizer~" .Values.optimizedb.conf.password }}
{{- $dbName := include "optimizedb.conf.dbName" . }}
{{- $port := default "3306" .Values.optimizedb.conf.port }}
{{- $schema := default "optimizer" .Values.optimizedb.conf.schema }}
{{- printf "%s:%s@tcp(%s:%s)/%s?createDatabaseIfNotExist=true&charset=utf8mb4&parseTime=true&loc=Local" $name $password $dbName $port $schema -}}
{{- end }}

{{- define "optimizedb.conf.datasource.maxOpenConns" -}}
{{- $maxOpenConns := default 10 .Values.optimizedb.conf.maxOpenConns }}
{{- printf "%d" $maxOpenConns -}}
{{- end }}

{{- define "optimizedb.data.datasource" -}}
{{- $name := default "optimizer" .Values.optimizedb.data.user }}
{{- $password := default "Optimizer~" .Values.optimizedb.data.password }}
{{- $dbName := include "optimizedb.data.dbName" . }}
{{- $port := default "3306" .Values.optimizedb.data.port }}
{{- $schema := default "optimizer" .Values.optimizedb.data.schema }}
{{- printf "%s:%s@tcp(%s:%s)/%s?createDatabaseIfNotExist=true&charset=utf8mb4&parseTime=true&loc=Local" $name $password $dbName $port $schema -}}
{{- end }}

{{- define "optimizedb.data.datasource.maxOpenConns" -}}
{{- $maxOpenConns := default 20 .Values.optimizedb.data.maxOpenConns }}
{{- printf "%d" $maxOpenConns -}}
{{- end }}

{{- define "optimizedb.user.datasource" -}}
{{- $name := default "optimizer" .Values.optimizedb.data.user }}
{{- $password := default "Optimizer~" .Values.optimizedb.data.password }}
{{- $dbName := include "optimizedb.data.dbName" . }}
{{- $port := default "3306" .Values.optimizedb.data.port }}
{{- $schema := default "optimizer" .Values.optimizedb.data.schema }}
{{- printf "%s:%s@tcp(%s:%s)/%s?createDatabaseIfNotExist=true&charset=utf8mb4&parseTime=true&loc=Local" $name $password $dbName $port $schema -}}
{{- end }}

{{- define "optimizedb.user.datasource.maxOpenConns" -}}
{{- $maxOpenConns := default 10 .Values.optimizedb.user.maxOpenConns }}
{{- printf "%d" $maxOpenConns -}}
{{- end }}

{{- define "optimizedb.name" -}}
{{- default "optimizedb" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "optimizedb.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "optimizedb.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "optimizedb.conf.dbName" -}}
{{- if .Values.optimizedb.conf.dbHost }}
{{- .Values.optimizedb.conf.dbHost }}
{{- else }}
{{- include "optimizerDB.svcName" . }}
{{- end -}}
{{- end -}}

{{- define "optimizedb.data.dbName" -}}
{{- if .Values.optimizedb.data.dbHost }}
{{- .Values.optimizedb.data.dbHost }}
{{- else }}
{{- include "optimizerDB.svcName" . }}
{{- end -}}
{{- end -}}


{{/*
Common labels for optimizedb
*/}}
{{- define "optimizedb.labels" -}}
helm.sh/chart: {{ include "optimizer-chart.chart" . }}
{{ include "optimizedb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels for optimizedb
*/}}
{{- define "optimizedb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "optimizerDB.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}

{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "optimizer-chart.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "optimizer-chart.labels" -}}
helm.sh/chart: {{ include "optimizer-chart.chart" . }}
{{ include "optimizer-chart.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "optimizer-chart.selectorLabels" -}}
app.kubernetes.io/name: {{ include "optimizer-chart.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "optimizer-chart.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "optimizer-chart.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
