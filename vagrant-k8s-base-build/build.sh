#!/bin/bash

vagrant init ubuntu/bionic64
vagrant up

vagrant ssh -c "sudo apt-get update"
vagrant ssh -c "sudo apt-get install -y apt-transport-https ca-certificates curl"
vagrant ssh -c "sudo sh -c 'sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -'"
vagrant ssh -c "sudo sh -c 'echo \"deb https://apt.kubernetes.io/ kubernetes-xenial main\" > /etc/apt/sources.list.d/kubernetes.list'"
vagrant ssh -c "sudo apt-get update"
vagrant ssh -c "sudo apt-get install -y kubelet kubeadm kubectl"
vagrant ssh -c "sudo apt-mark hold kubelet kubeadm kubectl"
vagrant ssh -c "sudo apt-get install -y kubernetes-cni"
vagrant ssh -c "sudo systemctl enable kubelet"
vagrant ssh -c "sudo systemctl start kubelet"

vagrant ssh -c "sudo apt update"
vagrant ssh -c "sudo apt install apt-transport-https ca-certificates curl software-properties-common"
vagrant ssh -c "sudo sh -c 'sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -'"
vagrant ssh -c "sudo add-apt-repository \\\"deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable\\\""
vagrant ssh -c "sudo apt update"
vagrant ssh -c "sudo apt-cache policy docker-ce"
vagrant ssh -c "sudo apt install -y docker-ce"

vagrant ssh -c "sudo usermod -aG docker ubuntu"

vagrant ssh -c "sudo systemctl daemon-reload"
vagrant ssh -c "sudo systemctl restart kubelet"

vagrant ssh -c "sudo apt-get clean"
vagrant ssh -c "sudo dd if=/dev/zero of=/EMPTY bs=1M"
vagrant ssh -c "sudo rm -f /EMPTY"
vagrant ssh -c "sudo sh -c 'cat /dev/null > ~/.bash_history && history -c && exit'"

vagrant package --output ubuntu18k8s.box
vagrant box remove jibijose/ubuntu18k8s
vagrant box add jibijose/ubuntu18k8s ubuntu18k8s.box
vagrant destroy -f
rm -rf Vagrantfile *.log .vagrant *.box
