#curl -sL https://raw.githubusercontent.com/crossplane/crossplane/master/install.sh | sh
#sudo mv kubectl-crossplane /usr/local/bin

kubectl create namespace crossplane-system
helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
helm install crossplane --namespace crossplane-system crossplane-stable/crossplane --version 1.4.1