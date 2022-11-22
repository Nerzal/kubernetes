# kubernetes

## Initial Setup

https://pacroy.com/single-node-kubernetes-on-home-lab-using-microk8s-metallb-and-traefik-7bb1ea38fcc2

> sudo snap install microk8s --classic --channel=1.21

```bash
sudo usermod -a -G microk8s $USER
sudo chown -f -R $USER ~/.kube
su - $USER
```

check status

> microk8s status --wait-ready

enable dns and storage

> microk8s enable dns storage

### Add hostname and ip

> /var/snap/microk8s/current/certs/csr.conf.template

### Grab config

> microk8s config > admin.config

Copy config

> scp root@noobygames.de:~/admin.config .

### Test config

> kubectl get nodes

### LoadBalancer

> microk8s enable metallb

Pate the IP of server: 5.189.135.7

## Install traefik

helm repo add traefik https://helm.traefik.io/traefik
helm repo update
kubectl create namespace traefik
helm install traefik traefik/traefik -n traefik

### Check traefik

> kubectl get all -n traefik

### Configure traefik to use LE

> helm upgrade traefik traefik/traefik -n traefik --values configs/traefik/values.yml

check traefik

> helm get manifest traefik -n traefik

## TLS 1.2

> kubectl apply -f tlsoption.yml

## Kubernetes dashboard

enable:
> microk8s enable dashboard

url: https://127.0.0.1:10443/#

forward: 
> kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443