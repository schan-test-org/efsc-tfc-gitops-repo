########################################
# Common
########################################
project     = "dev-eks-prj"
aws_region  = "ap-northeast-2"
env             = "dev"

default_tags = {
  dept  = "DEVOPS/TERRAFORM-CLOUD-GITOPS-TESTING"
}

########################################
# workspace setting
########################################
tfc_org = "schan-test"
tfc_wk = "dev-eks-tfc"

########################################
# etc setting
########################################
eks_cluster_name       = "test-deveks"
vpc_id       = "vpc-0e8acf616f7d0dd34"
vpc_cidr     = "10.30.0.0/16"
subnet_ids   = ["subnet-0dea2a38484eed006", "subnet-0515d47ea98e7952e"]

########################################
# efs
########################################
file_system_list = {
  efs_st = {
    name = "test-deveks-efs"
  }
  # data_hsql_data = {
  #   name = "data_hsql_data"
  # }

}

########################################
# helm
########################################
helm_release_name   = "aws-efs-csi-driver"
helm_chart_name     = "aws-efs-csi-driver"
helm_chart_version  = "2.3.8"
# helm_chart_version  = "2.3.5"
helm_repository_url = "https://kubernetes-sigs.github.io/aws-efs-csi-driver/"

create_namespace    = false
namespace           = "kube-system"

replica_count       = 1

resources           = <<EOF
limits:
  memory: "100Mi"
requests:
  cpu: "100m"
  memory: "100Mi"
EOF

affinity = <<EOF
nodeAffinity:
  requiredDuringSchedulingIgnoredDuringExecution:
    nodeSelectorTerms:
    - matchExpressions:
      - key: role
        operator: In
        values:
        - ops
EOF

node_selector = ""
# node_selector = <<EOF
# role: ops
# EOF

# tolerations   = ""
tolerations   = <<EOF
- key: "role"
  operator: "Equal"
  value: "ops"
  effect: "NoSchedule"
EOF

topology_spread_constraints = ""







