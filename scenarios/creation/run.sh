#!/usr/bin/env bash

# Before provisioners
kubectl apply -f scenarios/creation/sample1.yaml
kubectl apply -f scenarios/creation/sample2.yaml

# Scaling up from 0
kubectl scale deployment sample1 --replicas 3
kubectl scale deployment sample2 --replicas 3

# After provisioners
kubectl apply -f scenarios/creation/provisioner1.yaml
kubectl apply -f scenarios/creation/provisioner2.yaml


# Scaling up from 3
kubectl scale deployment sample2 --replicas 5

# Scaling up from 3
kubectl scale deployment sample2 --replicas 6
