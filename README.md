# k8s-elk

A collection of Kubernetes config files to deploy the ELK stack to a cluster. Used and tested with `minikube` on a local development environment. Probably not suitable for production.

Content mainly follows the [Digital Ocean tutorial](https://www.digitalocean.com/community/tutorials/how-to-set-up-an-elasticsearch-fluentd-and-kibana-efk-logging-stack-on-kubernetes) with adaptations for v7 of Elasticsearch and Kibana.

## Deployment

1. Create the `kube-logging` namespace
   1. `kubectl create -f kube-logging.yml`
2. Create the headless Elasticsearch service to define the DNS domain for the pods
   1. `kubectl create -f elasticsearch-service.yml`
3. Create the Elasticsearch stateful set
   1. `kubectl create -f elasticsearch-statefulset.yml`
4. Create the Kibana service and deployment
   1. `kubectl create -f kibana.yml`

Wait a few minutes, and then...

1. Check all pods are running
   1. `kubectl -n kube-logging get pods` should show four pods which are running
2. Forward the `kibana` service to a local port to view the UI in your browser
   1. `kubectl port-forward -n kube-logging <kibana_pod_name> 5601:5601` replacing `<kibana_pod_name>` with the name of the running Kibana pod