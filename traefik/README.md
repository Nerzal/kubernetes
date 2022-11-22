## Dashboard

Access: http://localhost:9000/dashboard/#/
FWD:  kubectl port-forward $(kubectl get pods --selector "app.kubernetes.io/name=traefik" --output=name -n traefik) -n traefik 9000:9000