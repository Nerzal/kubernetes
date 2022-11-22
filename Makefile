check-tls:
	kubectl exec -it $(kubectl get pod -n traefik -o name) -n traefik -- cat /data/letsencrypt.json

service-whoami:
	kubectl get svc -n whoami

traefik-dashboard:
	kubectl port-forward $(kubectl get pods --selector "app.kubernetes.io/name=traefik" --output=name -n traefik) -n traefik 9000:9000

traefik-logs:
	kubectl logs $(kubectl get pod -n traefik -o name) -n traefik -f

kubernetes-dashboard:
	kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443