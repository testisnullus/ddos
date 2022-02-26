default:
	kubectl apply -f values/namespaces.yaml

monitoring:
	helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
	helm repo up
	helm upgrade --install prometheus prometheus-community/kube-prometheus-stack --version 16.10.0 -f values/values-prometheus-operator.yaml -n monitoring
	helm upgrade --install blackbox prometheus-community/prometheus-blackbox-exporter -f values/values-blackbox-exporter.yaml -n monitoring
	kubectl apply -f monitoring-common/prometheusRules -n monitoring
	kubectl apply -f monitoring-common/dashboards -n monitoring