helm install astronomy ./ --values values.yaml --namespace astronomy --create-namespace

kubectl scale deployment --all --replicas=0 -n astronomy


linode-cli lke update-node-pool 12345 --count 0
linode-cli lke update-node-pool 67890 --count 0

linode-cli lke update-node-pool 12345 --count 3
linode-cli lke update-node-pool 67890 --count 2

linode-cli lke clusters-list
