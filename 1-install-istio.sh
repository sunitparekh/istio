istioctl version --remote=false
istioctl verify-install

istioctl profile list
https://istio.io/docs/setup/additional-setup/config-profiles/

istioctl manifest apply --set profile=demo

watch kubectl get pods -n istio-system

# open new tabs to run following dashboards
istioctl dashboard kiali  # admin/admin
istioctl dashboard jaeger

istioctl dashboard grafana
istioctl dashboard prometheus





