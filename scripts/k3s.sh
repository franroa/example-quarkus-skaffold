#!/bin/bash
echo "**** Begin installing k3s"

#curl -fL https://get.k3s.io | sh -s - server --cluster-init --disable-apiserver --disable-controller-manager --disable-scheduler
#Install
# Installing k8s with server docker, otherwise kubernetes will not find the images locally
curl -sfL https://get.k3s.io | INSTALL_K3S_VERSION=v1.19.5+k3s1 K3S_KUBECONFIG_MODE="644" sh -s - server --docker
echo "**** End installing k3s"

#kubectl proxy --address='0.0.0.0' /dev/null &
