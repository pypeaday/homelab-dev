terraform {
  required_providers {
    kind = {
      source  = "tehcyx/kind"
      version = "~> 0.0.19"
    }
  }
}

provider "kind" {
}

resource "kind_cluster" "default" {
  wait_for_ready = false
  name           = "foo-tf"
  kind_config {
    api_version = "kind.x-k8s.io/v1alpha4"
    kind        = "Cluster"

    node {
      role = "control-plane"
    }

    node {
      role = "worker"
    }
  }
}
