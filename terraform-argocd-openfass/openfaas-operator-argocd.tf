resource "argocd_application" "openfaas" {

  # example might be some credentials to be dependent on
  depends_on = []

  metadata {
    name      = local.deployment_name
    namespace = var.argocd_provider.namespace
  }

  spec {
    source {
      repo_url        = var.repo_url
      path            = var.path
      target_revision = var.revision

      helm {
        values = yamlencode({
          operator = {
            create = true
          }
          generateBasicAuth = true
          functionNamespace = "openfaas-fn"

        })

        dynamic "parameter" {
          # Found in openfaas-operator-argocd-values.tf 
          for_each = local.deployment_parameters
          content {
            name         = "openfaas.${parameter.key}"
            value        = parameter.value
            force_string = false
          }
        }
      }
    }
    destination {
      server    = "https://kubernetes.default.svc"
      namespace = var.deployment_namespace
    }
    revision_history_limit = 2
    sync_policy {
      automated = {
        prune       = true
        self_heal   = true
        allow_empty = true
      }
      sync_options = ["CreateNamespace=true"]
    }
  }
}
