deploy:
	kubectl create -f kube-logging.yml
	kubectl create -f elasticsearch-service.yml
	kubectl create -f elasticsearch-statefulset.yml
	kubectl create -f kibana.yml
	kubectl create -f fluentd.yml
