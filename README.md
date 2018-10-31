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
To create and start cluster having 1 master on k8s1 and 2 workers (k8s2 and k8s3), ssh to k8s1 and run `/vagrant/scripts/bootstrap_deployment.sh` as root user

```
root@k8s1:~# /vagrant/scripts/bootstrap_deployment.sh
service "springwebapp-service" deleted
deployment.extensions "springwebapp-deployment" deleted
service/springwebapp-service created
deployment.extensions/springwebapp-deployment created
```
### Test cluster
Check kubernetes cluster services, deployments, pods and nodes using below commands.   
`kubectl get [service|deployment|pod|node]`

After some time, pods list show available total count as 3 (as mentioned in deployment xml or command)   

If something goes wrong you can describe each and find the reason   
`kubectl describe [service|deployment|pod|node] [servicename|deploymentname|podname|nodename]`

### Test service
`kubectl describe service springwebapp-service` shows details of service. Example output is shown below, however if you are following this then IPs might be different.   
```
root@k8s1:~# kubectl describe service springwebapp-service
Name:              springwebapp-service
Namespace:         default
Labels:            <none>
Annotations:       <none>
Selector:          app=springwebapp
Type:              ClusterIP
IP:                10.99.19.6
Port:              http  80/TCP
TargetPort:        8080/TCP
Endpoints:         10.244.0.9:8080,10.244.1.9:8080,10.244.2.6:8080
Session Affinity:  None
Events:            <none>
```

To check service and endpoints you may use curl and see whether underlying java spring web responds properly.   
Service Check: `curl -v http://10.99.19.6:80/health`   
Endpoints Check: `curl -v http://10.244.X.X:8080/health`   

## Troubleshooting

## FAQs
