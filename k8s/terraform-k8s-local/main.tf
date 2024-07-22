module "local-cluster" {
  source     = "drape-io/local-cluster/kubernetes"
  version    = "0.0.4"
  certs_path = "./.certs"
  # k8s_config_path  = "/home/nic/.config/kube/koober-k3s.yaml"
  k8s_cluster_name = "local-cluster"
  k8s_config_path  = "./kubeconfig"
  base_domain      = "k8s.dev.local"
}
