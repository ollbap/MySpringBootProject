PROJECT_ID="$(gcloud config get-value project -q)"
VERSION=v2

./build.sh
docker tag pablo/my-spring-boot-project eu.gcr.io/${PROJECT_ID}/my-spring-boot-project:$VERSION
docker push eu.gcr.io/${PROJECT_ID}/my-spring-boot-project:$VERSION

