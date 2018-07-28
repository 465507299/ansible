#!/bin/bash

set -e

HTTP_SERVER="${HTTP_SERVER:-http://k8s.spacecig.com/softs/k8s/latest}"
RKT_ACI_ETCD="${RKT_ACI_ETCD:-etcd-v3.2.0}"
RKT_ACI_ETCD_TOOL="${RKT_ACI_ETCD_TOOL:-etcdctl-v3.2.10-linux-amd64}"
REGISTRY_REMOTE="${REGISTRY_REMOTE:-}"
REGISTRY_REMOTE_SPLIT="${REGISTRY_REMOTE_SPLIT:-}"
REGISTRY_ETCD_REPO="${REGISTRY_ETCD_REPO:-}"
REGISTRY_ETCD_VERSION="${REGISTRY_ETCD_VERSION:-}"

mkdir -p /etc/kubernetes/downloads
mkdir -p /etc/kubernetes/data

if [[ -e /etc/kubernetes/downloads/$RKT_ACI_ETCD.aci ]]; then
	echo 'etcd aci is already exist!'
else
  if [[ -n "${REGISTRY_REMOTE:-}" ]]; then
    rkt --insecure-options=image fetch docker://$REGISTRY_REMOTE$REGISTRY_ETCD_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_ETCD_VERSION
    rkt image export $REGISTRY_REMOTE$REGISTRY_ETCD_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_ETCD_VERSION /etc/kubernetes/downloads/$REGISTRY_ETCD_REPO-$REGISTRY_ETCD_VERSION.aci
  else
    curl $HTTP_SERVER/$RKT_ACI_ETCD.tgz > /etc/kubernetes/downloads/$RKT_ACI_ETCD.tgz
    cd /etc/kubernetes/downloads && tar -xzf /etc/kubernetes/downloads/$RKT_ACI_ETCD.tgz
    rm -rf /etc/kubernetes/downloads/$RKT_ACI_ETCD.tgz
    echo 'registry aci download completed!'
  fi
fi

if ! [ -x "$(command -v etcdctl)" ]; then
  if ! [[ -e /etc/kubernetes/downloads/$RKT_ACI_ETCD_TOOL ]]; then
    curl $HTTP_SERVER/$RKT_ACI_ETCD_TOOL.tgz > /etc/kubernetes/downloads/$RKT_ACI_ETCD_TOOL.tgz
    cd /etc/kubernetes/downloads && tar -xzf /etc/kubernetes/downloads/$RKT_ACI_ETCD_TOOL.tgz
    rm -rf /etc/kubernetes/downloads/$RKT_ACI_ETCD_TOOL.tgz    
  fi
  chmod 0744 /etc/kubernetes/downloads/$RKT_ACI_ETCD_TOOL
  ln -s /etc/kubernetes/downloads/$RKT_ACI_ETCD_TOOL /usr/bin/etcdctl
fi