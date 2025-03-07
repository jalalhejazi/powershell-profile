
function k   { kubectl $args}
function ka  { kubectl apply -f $args}
function kd  { kubectl delete -f $args}
function kg  { kubectl get $args}    
function kx  { kubectl exec -it $args -- /bin/sh}
function kp  { kubectl port-forward $args}
function kl  { kubectl logs $args}
function klo { kubectl logs -f $args}
function kpf { kubectl port-forward $args}
function kdp { kubectl describe pod $args}
function kds { kubectl describe service $args}
function kdn { kubectl describe node $args}
function kdd { kubectl describe deployment $args}
function kdc { kubectl describe configmap $args}
function kdr { kubectl describe replicaset $args}
function kdi { kubectl describe ingress $args}
function kdl { kubectl describe limitrange $args}
function kdt { kubectl describe secret $args}
function kdy { kubectl describe serviceaccount $args}



## Minikube
function cluster-create-minikube {
    minikube start --network-plugin=cni --cni=calico -p demo

<#-- 
    😄  [demo] minikube v1.35.0 on Microsoft Windows 11 Home 10.0.26100.3194 Build 26100.3194
✨  Automatically selected the docker driver
❗  With --network-plugin=cni, you will need to provide your own CNI. See --cni flag as a user-friendly alternative
📌  Using Docker Desktop driver with root privileges
👍  Starting "demo" primary control-plane node in "demo" cluster
🚜  Pulling base image v0.0.46 ...
🔥  Creating docker container (CPUs=2, Memory=3500MB) ...
❗  Failing to connect to https://registry.k8s.io/ from inside the minikube container
💡  To pull new external images, you may need to configure a proxy: https://minikube.sigs.k8s.io/docs/reference/networking/proxy/
🐳  Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring Calico (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass
🏄  Done! kubectl is now configured to use "demo" cluster and "default" namespace by default

--#>
}

function cluster-delete-minikube {
    minikube delete -p demo
}


## Helm
function helm-install-cert-manager {
    kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.17.1/cert-manager.crds.yaml
    kubectl create namespace cert-manager
    helm repo add jetstack https://charts.jetstack.io --force-update
    helm repo update
    helm install cert-manager --namespace cert-manager --version v1.17.1 jetstack/cert-manager
    kubectl get all -n cert-manager
}