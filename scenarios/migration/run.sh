#!/usr/bin/env bash

kubectl apply -f scenarios/migration/sample1-2.yaml
kubectl apply -f scenarios/migration/sample2-1.yaml

# restart sample1 and sample2
kubectl rollout restart deploy sample1
kubectl rollout restart deploy sample2

kubectl apply -f scenarios/migration/provisioner1-x.yaml


kubectl drain -l 'label-x=provisioner1-2022-03-04' --ignore-daemonsets # aws-node daemonset on aws


#### Defragmentation
kubectl scale deployment sample2 --replicas 5
# -> 2 m5.large
# defragment into 1 m5.xlarge
kubectl drain -l 'label-x=provisioner1-2022-03-04-x' --ignore-daemonsets # aws-node daemonset on aws
