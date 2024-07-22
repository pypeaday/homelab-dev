variable "argocd_provider_password" {
  type    = string
  default = null
}

variable "argocd_provider" {
  type = object({
    address                     = optional(string, "argocd-server.svc.cluster.local")
    namespace                   = optional(string, "argocd")
    use_local_config            = optional(string)
    port_forward                = optional(bool)
    port_forward_with_namespace = optional(bool)
    username                    = optional(string)
    password                    = optional(string)
    auth_token                  = optional(string)
    insecure                    = optional(string)
    kubernetes = optional(object({
      host                   = string
      token                  = string
      cluster_ca_certificate = string
    }))
  })
}

provider "argocd" {
  # how to connect to ArgoCD
  server_addr                 = var.argocd_provider.address
  port_forward                = var.argocd_provider.port_forward
  port_forward_with_namespace = var.argocd_provider.port_forward_with_namespace
  insecure                    = var.argocd_provider.insecure

  # authenticate with ArgoCD
  use_local_config = var.argocd_provider.use_local_config
  username         = var.argocd_provider.username
  password         = var.argocd_provider.password
  auth_token       = var.argocd_provider.auth_token

  # this allows using ArgoCD provider with Argo even if it's not exposed outside
  dynamic "kubernetes" {
    for_each = { for k in [var.argocd_provider.kubernetes] : k.host => k if var.argocd_provider.kubernetes != null }
    content {
      host                   = kubernetes.value["host"]
      cluster_ca_certificate = base64decode(kubernetes.value["cluster_ca_certificate"])
      token                  = kubernetes.value["token"]
    }
  }

}
