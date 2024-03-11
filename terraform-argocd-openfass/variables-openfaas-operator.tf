variable "deployment_namespace" {
  type    = string
  default = "openfaas"
}
variable "repo_url" {
  type    = string
  default = "https://github.com/openfaas/faas-netes.git"
}

variable "path" {
  type        = string
  description = "The path to the helm chart from the repo root"
  default     = "openfaas"
}

variable "revision" {
  type        = string
  description = "The revision of the operator to deploy"
  default     = "main"
}
