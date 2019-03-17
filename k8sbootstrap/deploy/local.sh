#!/usr/bin/env bash
kubectl config use-context docker-for-desktop
kubectl apply -f templates/admin-creation.yaml
kubectl apply -f templates/storagefix.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.7.3/manifests/metallb.yaml
helm init
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}')
kubectl apply -f templates/hello-world-example.yaml
