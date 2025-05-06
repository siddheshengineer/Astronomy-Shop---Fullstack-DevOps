helm install astronomy ./ --values values.yaml --namespace astronomy --create-namespace

kubectl scale deployment --all --replicas=0 -n astronomy
