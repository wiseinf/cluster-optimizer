## Introduction

This repository contains helm chart for **Cluster Optimzier**.  


## Quich Start

1. Add repository using:
```sh
helm repo add cluster-optimzier https://github.com/wiseinf/cluster-optimzier/
```

1. Searching repo to check if it has a cluster-optimizer chart.
```sh
helm search repo cluster-optimzier
```

1. Update repository
```sh
helm repo update
```

1. Install charts
```sh
helm install cluster-optimizer-helm-chart --generate-name
```