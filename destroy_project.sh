
ps aux | grep 'kubectl port-forward' | grep -v grep | awk '{print $2}' | xargs -r kill
kubectl delete -f postgresql-service.yaml

kubectl delete -f postgresql-deployment.yaml
kubectl delete -f pv.yaml
kubectl delete -f pvc.yaml


eksctl delete cluster --name my-cluster --region us-east-1
