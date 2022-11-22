## Install nextcloud

helm repo add nextcloud https://nextcloud.github.io/helm/

install:

> helm install nextcloud -f values.yml nextcloud/nextcloud --namespace nextcloud

### Note

For better performance etc. you have to configure nextcloud with a resolvable database
host. To configure nextcloud to use and external database host:


1. Complete your nextcloud deployment by running:

  NOTE: It may take a few minutes for the LoadBalancer IP to be available.
        Watch the status with: 'kubectl get svc --namespace nextcloud -w nextcloud'

  export APP_HOST=$(kubectl get svc --namespace nextcloud nextcloud --template "{{ range (index .status.loadBalancer.ingress 0) }}{{ . }}{{ end }}")
  export APP_PASSWORD=$(kubectl get secret --namespace nextcloud nextcloud -o jsonpath="{.data.nextcloud-password}" | base64 --decode)

  ## PLEASE UPDATE THE EXTERNAL DATABASE CONNECTION PARAMETERS IN THE FOLLOWING COMMAND AS NEEDED ##

  helm upgrade nextcloud nextcloud/nextcloud \
    --set nextcloud.password=$APP_PASSWORD,nextcloud.host=$APP_HOST,service.type=LoadBalancer,mariadb.enabled=false,externalDatabase.user=nextcloud,externalDatabase.password=°«hÑPÂþ§kÎkQVR§ÛVQ3E7ÇÞ³¥XÏ¸6nçZÝìÌôçÝMLëkHèðß»¡HMrå£ëmÏÊKH°ÐÞvÖúGÞ§ES×YyíuýßÄtV¾ËCÙÔu2ÒÛbûÓ®9Þ¿è£äÌ¡hÚÁÁòìÌÖLðífåèKõhÜ¾ðýáÎÔmñè,externalDatabase.database=nextcloud,externalDatabase.host=YOUR_EXTERNAL_DATABASE_HOST