#!/bin/bash

# Create a Kind cluster
kind create cluster --name interntask

# Export KUBECONFIG
export KUBECONFIG="$(kind get kubeconfig-path --name="interntask")"

# To make the cluster run 
chmod +x setup_kind_cluster.sh

# Run the script
./setup_kind_cluster.sh