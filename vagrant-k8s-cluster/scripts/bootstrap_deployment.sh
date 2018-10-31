#!/bin/bash

kubectl delete service springwebapp-service
kubectl delete deployment springwebapp-deployment

kubectl create -f /vagrant/service.yml -f /vagrant/deployment.yml
#kubectl run --image=registry.hub.docker.com/jibijose/springwebapp springwebapp-deployment --port=8080 --env="DOMAIN=cluster"
#kubectl expose deployment springwebapp-deployment --port=80 --name=springwebapp-service

