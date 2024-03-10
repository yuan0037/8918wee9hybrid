# TerraForm with AKS

## AKS
Terraform can be used to provision an AKS cluster and export/generate the configuration file that can be applied to the current context of Kubenetes. 

## AKS Deployment
If you want to avoid specifying the kubeconfig file path every time you run a kubectl command, you can set the KUBECONFIG environment variable to the path of your kubeconfig file:

```export KUBECONFIG=path/to/your/kubeconfig.yaml``` 

Deployment can be done easily by using kubectrl apply -f [deployment yaml file] once the current context is set to the proper cluster. 

```kubectl apply -f deployment.yaml```
