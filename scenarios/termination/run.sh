#!/usr/bin/env bash

# node deletion

# emptiness termination
kubectl scale deployment sample1 --replicas 0
kubectl scale deployment sample2 --replicas 0

#  node expiry termination
kubectl apply -f scenarios/termination/provisioner1-y.yaml
kubectl scale deployment sample2 --replicas 5
