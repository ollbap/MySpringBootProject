PROJECT_ID="$(gcloud config get-value project -q)"
VERSION=v5

./build.sh
docker tag pablo/my-spring-boot-project eu.gcr.io/${PROJECT_ID}/my-spring-boot-project:$VERSION
docker push eu.gcr.io/${PROJECT_ID}/my-spring-boot-project:$VERSION

gcloud alpha cloud-shell ssh --command="/google/google-cloud-sdk/bin/kubectl set image deployment/hello-web hello-web=eu.gcr.io/mytestproyect-205519/my-spring-boot-project:$VERSION"


