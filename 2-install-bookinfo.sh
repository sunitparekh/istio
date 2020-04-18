# enable auto injection of sidecar envoy proxy
kubectl get ns --show-labels
kubectl label namespace default istio-injection=enabled
kubectl get ns --show-labels

# deploy bookinfo application
# if possible get latest from 
https://raw.githubusercontent.com/istio/istio/release-1.5/samples/bookinfo/platform/kube/bookinfo.yaml

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.5/samples/bookinfo/platform/kube/bookinfo.yaml

kubectl port-forward service/productpage 9080:9080

# show application with different ratings with multiple refresh
istioctl dashboard kiali
# show "Versioned App Graph"

cd bookinfo/routing

# deploy Gateway 
kubectl apply -f 01_bookinfo-gateway.yaml

# deploy destination rules and virtual service for reviews
kubectl apply -f 02_route-rule-all-v1.yaml
# change to V2.. show Kiali and revert back to V1

kubectl apply -f 03_route-rule-reviews-user-peter-v2.yaml

kubectl apply -f 04_route-rule-reviews-80-20.yaml

kubectl apply -f 05_route-rule-reviews-v2.yaml







