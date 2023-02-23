variable "project" {
  type        = string
  default     = ""
  description = "project code which used to compose the resource name"
}

variable "env" {
  type        = string  
  default     = ""
  description = "environment: dev, stg, qa, prod "
}

variable "region" {
  type        = string
  default     = ""
  description = "aws region to build network infrastructure"
}

variable "common_tags" {
  type        = map
  default     = {}
  description = "chart version for ebs csi controller"
}

variable "k8s_private_subnet_list" {
	type = list
	default = []
	description = "eks private subnet"
}

variable "eks_cluster_name" {
  type        = string
  default     = ""
  description = "eks cluster name"
}

variable "eks_endpoint_url" {
  type        = string
  default     = ""
  description = "url of eks master."
}

variable "eks_cluster_certificate_authority_data" {
  type        = string
  default     = ""
  description = "PEM-encoded root certificates bundle for TLS authentication."
}

variable "eks_auth_token" {
  type        = string
  default     = ""
  description = "eks cluster auth token"
}

variable "eks_oidc_provider_arn" {
  type        = string
  default     = ""
  description = "openid connect provider arn"
}

variable "eks_oidc_provider_url" {
  type        = string
  default     = ""
  description = "openid connect provider url"
}

variable "helm_release_name" {
  default     = ""
  description = "helm release name"
}

variable "helm_chart_name" {
  description = "helm chart name"
  default     = ""
}

variable "helm_chart_version" {
  description = "helm chart version"
  default     = ""
}

variable "helm_repository_url" {
  description = "helm chart repository url"
  default     = ""
}

variable "create_namespace" {
  type        = bool
  default     = true
  description = "create the namespace if it does not yet exist"
}

variable "namespace" {
  type        = string
  default     = "kube-system"
  description = "namespace to install efs"
}

variable "replica_count" {
  type        = number
  default     = 2
}

variable "resources" {
  type = string
  default = ""
}

variable "affinity" {
  type    = string
  default = ""
}

variable "tolerations" {
  type    = string
  default = ""
}

variable "node_selector" {
  type    = string
  default = ""
}

variable "topology_spread_constraints" {
  type    = string
  default = ""
}
