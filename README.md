# Kubernetes Playground based on vagrant, java 8, docker and ansible
This project contains all files needed to bring up a kubernetes vagrant cluster from scratch. 

- `springwebapp`, This has a java 8 spring boot web app project exposing few endpoints. It also has Dockerfile and commands to push into docker hub.
- `vagrant-k8s-base-build`, This Vagrantfile locally builds and stores a base box having all updates, kubernetes and docker softwares.
- `vagrant-k8s-cluster`, This Vagrantfile builds 3 vagrant machines starting from vagrant box in step 2 and deploys docker image from step1 .

### Prerequisites
You need the following installed to use this playground.
- `Java`, java 8u181 is used.
- `VirtualBox`, 5.2.12 is used
- `Vagrant`, version 2.1.1 is used.

However any version of java 8 and any not so old versions of virtualbox and vagrant should work without any trouble.

## Build project, create, push docker image

### Build java project
### Test java project
### Create docker image
### Push docker image

## Build base vagrant box

### Build vagrant box

## Create kubernetes cluster and deploy docker image

### Create and deploy cluster
### Test cluster
### Test service

## Troubleshooting

## FAQs