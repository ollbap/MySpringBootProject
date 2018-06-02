PROJECT_ID="$(gcloud config get-value project -q)"

./build.sh
docker run --rm -p 8080:8080 pablo/my-spring-boot-project:latest

#Deploy image to my repository
docker tag pablo/my-spring-boot-project eu.gcr.io/${PROJECT_ID}/my-spring-boot-project
docker images ls
docker push eu.gcr.io/${PROJECT_ID}/my-spring-boot-project

#gcloud docker -- push pablo/${PROJECT_ID}/my-spring-boot-project:latest

gcloud config set compute/zone us-central1-b
gcloud container clusters create hello-cluster --num-nodes=1
kubectl run hello-web --image=eu.gcr.io/${PROJECT_ID}/my-spring-boot-project --port 8080
kubectl get pods

kubectl expose deployment hello-web --type=LoadBalancer --port 80 --target-port 8080

kubectl get service

#Stop
kubectl delete service hello-web
gcloud container clusters delete hello-cluster

