## How to install the Astronomy Helm Charts
helm install astronomy ./ --values values.yaml --namespace astronomy --create-namespace

## Install Nginx Ingress Controller
helm repo add nginx-ingress https://kubernetes.github.io/ingress-nginx

helm install nginx nginx-ingress/ingress-nginx \
  --set controller.publishService.enabled=true \
  --namespace nginx-ingress --create-namespace

## Kubernetes Secrete to access private repository
k create secret docker-registry pvt-regcred --docker-server=docker.io \
> --docker-username=$DOCKER_USER \
> --docker-password=$DOCKER_TOKEN \
> --docker-email=$DOCKER_USER_EMAIL



## Custom instructions
kubectl scale deployment --all --replicas=0 -n astronomy
### Linode Specific
linode-cli lke update-node-pool 12345 --count 0
linode-cli lke update-node-pool 67890 --count 0

linode-cli lke update-node-pool 12345 --count 3
linode-cli lke update-node-pool 67890 --count 2

linode-cli lke clusters-list
