#!/bin/bash

mkdir -p temp_dir
# Creates the YAMls 
apigeectl apply -f overrides/overrides.yaml --dry-run=client \
--print-yaml > ./temp_dir/rendered-manifest.yaml

# Removes all files except the namespace.yaml
find ../apigee-config-sync-demo/namespaces -type f ! -name 'namespace.yaml' -delete

#Splits the one big YAML into mulitple YAML seperated by namespace
manifest-splitter/manifest-splitter --kubeconfig "$HOME"/.kube/config \
--output=../apigee-config-sync-demo ./temp_dir/rendered-manifest.yaml

# Add the Cluster selector annotation
kpt fn eval ../apigee-config-sync-demo/namespaces  --image gcr.io/kpt-fn/set-annotations:v0.1.4 \
-- configsync.gke.io/cluster-name-selector=gke-azure-apigee-dy

#Validate config sync files
nomos vet --path=../apigee-config-sync-demo