#!/bin/bash

set -e

REGISTRY_LOCAL="${REGISTRY_REMOTE:-}"
REGISTRY_LOCAL_SPLIT="${REGISTRY_REMOTE_SPLIT:-}"
REGISTRY_REMOTE="${REGISTRY_REMOTE:-}"
REGISTRY_REMOTE_SPLIT="${REGISTRY_REMOTE_SPLIT:-}"
REGISTRY_KUBELET_REPO="${REGISTRY_KUBELET_REPO:-}"
REGISTRY_KUBELET_VERSION="${REGISTRY_KUBELET_VERSION:-}"
REGISTRY_PAUSE_REPO="${REGISTRY_PAUSE_REPO:-}"
REGISTRY_PAUSE_VERSION="${REGISTRY_PAUSE_VERSION:-}"
REGISTRY_REGISTRY_REPO="${REGISTRY_REGISTRY_REPO:-}"
REGISTRY_REGISTRY_VERSION="${REGISTRY_REGISTRY_VERSION:-}"
REGISTRY_ETCD_REPO="${REGISTRY_ETCD_REPO:-}"
REGISTRY_ETCD_VERSION="${REGISTRY_ETCD_VERSION:-}"
REGISTRY_FLANNEL_REPO="${REGISTRY_FLANNEL_REPO:-}"
REGISTRY_FLANNEL_VERSION="${REGISTRY_FLANNEL_VERSION:-}"
REGISTRY_KUBE_ROUTER_REPO="${REGISTRY_KUBE_ROUTER_REPO:-}"
REGISTRY_KUBE_ROUTER_VERSION="${REGISTRY_KUBE_ROUTER_VERSION:-}"
REGISTRY_COREDNS_REPO="${REGISTRY_COREDNS_REPO:-}"
REGISTRY_COREDNS_VERSION="${REGISTRY_COREDNS_VERSION:-}"
REGISTRY_DASHBOARD_REPO="${REGISTRY_DASHBOARD_REPO:-}"
REGISTRY_DASHBOARD_VERSION="${REGISTRY_DASHBOARD_VERSION:-}"
REGISTRY_HEAPSTER_REPO="${REGISTRY_HEAPSTER_REPO:-}"
REGISTRY_HEAPSTER_VERSION="${REGISTRY_HEAPSTER_VERSION:-}"
REGISTRY_ADDON_RESIZER_REPO="${REGISTRY_ADDON_RESIZER_REPO:-}"
REGISTRY_ADDON_RESIZER_VERSION="${REGISTRY_ADDON_RESIZER_VERSION:-}"

mkdir -p /etc/kubernetes/downloads
mkdir -p /etc/kubernetes/data

if [[ -e /etc/kubernetes/data/registry/docker/registry/v2/repositories/k8s/$REGISTRY_KUBELET_REPO ]]; then
	echo `$REGISTRY_KUBELET_REPO image ready!`
else
  docker pull $REGISTRY_REMOTE$REGISTRY_KUBELET_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_KUBELET_VERSION
  docker tag $REGISTRY_REMOTE$REGISTRY_KUBELET_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_KUBELET_VERSION $REGISTRY_LOCAL$REGISTRY_KUBELET_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_KUBELET_VERSION
  docker push $REGISTRY_LOCAL$REGISTRY_KUBELET_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_KUBELET_VERSION 
fi

if [[ -e /etc/kubernetes/data/registry/docker/registry/v2/repositories/k8s/$REGISTRY_PAUSE_REPO ]]; then
	echo `$REGISTRY_PAUSE_REPO image ready!`
else
  docker pull $REGISTRY_REMOTE$REGISTRY_PAUSE_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_PAUSE_VERSION
  docker tag $REGISTRY_REMOTE$REGISTRY_PAUSE_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_PAUSE_VERSION $REGISTRY_LOCAL$REGISTRY_PAUSE_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_PAUSE_VERSION
  docker push $REGISTRY_LOCAL$REGISTRY_PAUSE_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_PAUSE_VERSION 
fi

if [[ -e /etc/kubernetes/data/registry/docker/registry/v2/repositories/k8s/$REGISTRY_REGISTRY_REPO ]]; then
	echo `$REGISTRY_REGISTRY_REPO image ready!`
else
  docker pull $REGISTRY_REMOTE$REGISTRY_REGISTRY_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_REGISTRY_VERSION
  docker tag $REGISTRY_REMOTE$REGISTRY_REGISTRY_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_REGISTRY_VERSION $REGISTRY_LOCAL$REGISTRY_REGISTRY_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_REGISTRY_VERSION
  docker push $REGISTRY_LOCAL$REGISTRY_REGISTRY_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_REGISTRY_VERSION 
fi

if [[ -e /etc/kubernetes/data/registry/docker/registry/v2/repositories/k8s/$REGISTRY_ETCD_REPO ]]; then
	echo `$REGISTRY_ETCD_REPO image ready!`
else
  docker pull $REGISTRY_REMOTE$REGISTRY_ETCD_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_ETCD_VERSION
  docker tag $REGISTRY_REMOTE$REGISTRY_ETCD_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_ETCD_VERSION $REGISTRY_LOCAL$REGISTRY_ETCD_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_ETCD_VERSION
  docker push $REGISTRY_LOCAL$REGISTRY_ETCD_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_ETCD_VERSION 
fi

if [[ -e /etc/kubernetes/data/registry/docker/registry/v2/repositories/k8s/$REGISTRY_FLANNEL_REPO ]]; then
	echo `$REGISTRY_FLANNEL_REPO image ready!`
else
  docker pull $REGISTRY_REMOTE$REGISTRY_FLANNEL_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_FLANNEL_VERSION
  docker tag $REGISTRY_REMOTE$REGISTRY_FLANNEL_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_FLANNEL_VERSION $REGISTRY_LOCAL$REGISTRY_FLANNEL_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_FLANNEL_VERSION
  docker push $REGISTRY_LOCAL$REGISTRY_FLANNEL_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_FLANNEL_VERSION 
fi

if [[ -e /etc/kubernetes/data/registry/docker/registry/v2/repositories/k8s/$REGISTRY_KUBE_ROUTER_REPO ]]; then
	echo `$REGISTRY_KUBE_ROUTER_REPO image ready!`
else
  docker pull $REGISTRY_REMOTE$REGISTRY_KUBE_ROUTER_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_KUBE_ROUTER_VERSION
  docker tag $REGISTRY_REMOTE$REGISTRY_KUBE_ROUTER_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_KUBE_ROUTER_VERSION $REGISTRY_LOCAL$REGISTRY_KUBE_ROUTER_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_KUBE_ROUTER_VERSION
  docker push $REGISTRY_LOCAL$REGISTRY_KUBE_ROUTER_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_KUBE_ROUTER_VERSION 
fi

if [[ -e /etc/kubernetes/data/registry/docker/registry/v2/repositories/k8s/$REGISTRY_COREDNS_REPO ]]; then
	echo `$REGISTRY_COREDNS_REPO image ready!`
else
  docker pull $REGISTRY_REMOTE$REGISTRY_COREDNS_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_COREDNS_VERSION
  docker tag $REGISTRY_REMOTE$REGISTRY_COREDNS_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_COREDNS_VERSION $REGISTRY_LOCAL$REGISTRY_COREDNS_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_COREDNS_VERSION
  docker push $REGISTRY_LOCAL$REGISTRY_COREDNS_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_COREDNS_VERSION 
fi

if [[ -e /etc/kubernetes/data/registry/docker/registry/v2/repositories/k8s/$REGISTRY_DASHBOARD_REPO ]]; then
	echo `$REGISTRY_DASHBOARD_REPO image ready!`
else
  docker pull $REGISTRY_REMOTE$REGISTRY_DASHBOARD_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_DASHBOARD_VERSION
  docker tag $REGISTRY_REMOTE$REGISTRY_DASHBOARD_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_DASHBOARD_VERSION $REGISTRY_LOCAL$REGISTRY_DASHBOARD_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_DASHBOARD_VERSION
  docker push $REGISTRY_LOCAL$REGISTRY_DASHBOARD_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_DASHBOARD_VERSION 
fi

if [[ -e /etc/kubernetes/data/registry/docker/registry/v2/repositories/k8s/$REGISTRY_HEAPSTER_REPO ]]; then
	echo `$REGISTRY_HEAPSTER_REPO image ready!`
else
  docker pull $REGISTRY_REMOTE$REGISTRY_HEAPSTER_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_HEAPSTER_VERSION
  docker tag $REGISTRY_REMOTE$REGISTRY_HEAPSTER_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_HEAPSTER_VERSION $REGISTRY_LOCAL$REGISTRY_HEAPSTER_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_HEAPSTER_VERSION
  docker push $REGISTRY_LOCAL$REGISTRY_HEAPSTER_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_HEAPSTER_VERSION 
fi

if [[ -e /etc/kubernetes/data/registry/docker/registry/v2/repositories/k8s/$REGISTRY_ADDON_RESIZER_REPO ]]; then
	echo `$REGISTRY_ADDON_RESIZER_REPO image ready!`
else
  docker pull $REGISTRY_REMOTE$REGISTRY_ADDON_RESIZER_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_ADDON_RESIZER_VERSION
  docker tag $REGISTRY_REMOTE$REGISTRY_ADDON_RESIZER_REPO$REGISTRY_REMOTE_SPLIT$REGISTRY_ADDON_RESIZER_VERSION $REGISTRY_LOCAL$REGISTRY_ADDON_RESIZER_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_ADDON_RESIZER_VERSION
  docker push $REGISTRY_LOCAL$REGISTRY_ADDON_RESIZER_REPO$REGISTRY_LOCAL_SPLIT$REGISTRY_ADDON_RESIZER_VERSION 
fi