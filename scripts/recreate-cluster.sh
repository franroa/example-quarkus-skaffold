/usr/local/bin/k3s-uninstall.sh
./k3s.sh


cp /etc/rancher/k3s/k3s.yaml ~/.kube/config


kubectl apply -f ../k8s/nexus.yaml

#
#
#echo "--------------------------- Installing Crossplane ---------------------------"
#./crossplane.sh
#
#
#echo "--------------------------- Installing ArgoCD ---------------------------"
##k get applications
#
##https://aws.amazon.com/blogs/opensource/connecting-aws-managed-services-to-your-argo-cd-pipeline-with-open-source-crossplane/
##https://www.eksworkshop.com/intermediate/290_argocd/
##https://www.youtube.com/watch?v=eEcgn_gU3SM
##https://github.com/argoproj/argo-cd
##TODO use helm: https://www.arthurkoziel.com/setting-up-argocd-with-helm/
##https://github.com/argoproj/argo-helm/tree/master/charts/argo-cd
##kubectl create ns argo
##helm upgrade --install argo argo/argo -n argo
##https://argo-cd.readthedocs.io/en/stable/getting_started/#1-install-argo-cd
##kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
#kubectl create namespace argocd
#kubectl apply -nargocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
##kubectl apply -n argocd -k https://github.com/argoproj/argo-cd/manifests/crds\?ref\=stable
#
#
#echo "--------------------------- Installing Flagger ---------------------------"
#echo "--------------------------- Installing KEDA ---------------------------"
#echo "--------------------------- Installing HPA ---------------------------"
#echo "--------------------------- Installing VPA ---------------------------"
#echo "--------------------------- Installing ClusterAutoscaler ---------------------------"
#
#
#echo "--------------------------- Install Docker secrets ---------------------------"
#kubectl create secret generic regcred   --from-file=.dockerconfigjson=$HOME/.docker/config.json    --type=kubernetes.io/dockerconfigjson
#
#echo "--------------------------- Install Observability ---------------------------"
#./init-observability.sh
#
#
#kubectl apply -f ../argocd/crossplane
#
#
#kubectl apply -f ../argocd/minimum
#kubectl port-forward -n argocd svc/argocd-server 8080:80 &
#kubectl get pods -n argocd -l app=argo-server -o name | cut -d'/' -f 2
#kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
#
#
##TODO Install litmus, sonarqube, lombock
##TODO Multitenant
##TODO skaffold
##TODO Telepresence
##https://aws.amazon.com/blogs/containers/gitops-model-for-provisioning-and-bootstrapping-amazon-eks-clusters-using-crossplane-and-argo-cd/
##https://github.com/crossplane/provider-aws/blob/master/AUTHENTICATION.md
##https://argoproj.github.io/argo-workflows/argo-server-sso/
##Plugings: "kubectl confluent" and "kubectl crossplane"