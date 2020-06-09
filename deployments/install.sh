#!/bin/bash

kubectl create ns java
read
kubectl -n java create secret generic mysql-root-pass --from-literal=password=R00t
kubectl -n java create secret generic mysql-user-pass --from-literal=username=callicoder --from-literal=password=c@ll1c0d3r
kubectl -n java create secret generic mysql-db-url --from-literal=database=polls --from-literal=url='jdbc:mysql://polling-app-mysql:3306/polls?useSSL=false&serverTimezone=UTC&useLegacyDatetimeCode=false'
read

kubectl -n java apply -f mysql-deployment.yaml
kubectl -n java get pvc
read
kubectl -n java apply -f polling-app-server.yaml
kubectl -n java apply -f polling-app-client.yaml
