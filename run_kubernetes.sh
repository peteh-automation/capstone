#!/usr/bin/env bash

# This runs the container in a Kubernetes cluster

dockerpath=peterheybrock/capstone

kubectl run capstone --image=$dockerpath --port=8081

echo "wait for 20 seconds for pod to start"
sleep 20
kubectl get pods

kubectl port-forward pod/capstone 8000:8081
