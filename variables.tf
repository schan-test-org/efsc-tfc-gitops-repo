############################# main : var #######################################

variable "env" { type = string }
variable "aws_region" { type = string }
variable "project" { type = string }
variable "default_tags" { type = map(string) }

############################# bknd & vpc & network about : var #######################################
variable "tfc_org" { default = "" }
variable "tfc_wk" { default = "" }
variable "vpc_id" { default = "" }
variable "vpc_cidr" { default = "" }
variable "subnet_ids" { default     = [] }
variable "file_system_list" { default     = {} }

############################# eks-cluster : var #######################################
variable "eks_cluster_name" { default = "" }
variable "eks_endpoint_url" { default = "" }
variable "eks_cluster_certificate_authority_data" { default = "" }
variable "eks_auth_token" { default = "" }

variable "eks_oidc_provider_arn" { default     = "" }
variable "eks_oidc_provider_url" { default     = "" }

############################# helm : var #######################################
variable "helm_release_name" { default = "" }
variable "helm_chart_name" { default = "" }
variable "helm_chart_version" { default = "" }
variable "helm_repository_url" { default = "" }
variable "create_namespace" { default = true }
variable "namespace" { default = "kube-system" }

############################# others : var #######################################

variable "replica_count" { default = 2 }
variable "resources" { default = "" }
variable "affinity" { default = "" }
variable "tolerations" { default = "" }
variable "node_selector" { default = "" }
variable "topology_spread_constraints" { default = "" }

############################# others : 2nd var #######################################
