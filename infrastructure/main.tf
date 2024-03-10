# Define the resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.labelPrefix}-week9-RG"
  location = var.region
}

# Create an AKS cluster
resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = "8918aksyuan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "yuan00378918hybrid"
  default_node_pool {
    name                = "default"
    node_count          = 1
    vm_size             = "Standard_B2s"
    enable_auto_scaling = true
    min_count           = 1
    max_count           = 3
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    environment = "dev"
  }
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  sensitive = true
}

# Write Kubernetes configuration to a file
resource "local_file" "kubeconfig" {
  depends_on = [azurerm_kubernetes_cluster.aks_cluster]
  content    = azurerm_kubernetes_cluster.aks_cluster.kube_config_raw
  filename   = "./kubeconfig"
}