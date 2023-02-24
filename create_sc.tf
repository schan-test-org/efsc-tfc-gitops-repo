#####################################################################
# create sc

resource "kubernetes_storage_class" "efs-sc" {
  depends_on = [aws_efs_file_system.efs_st]
  metadata {
    name = var.storage_class_name
  }
  storage_provisioner = "efs.csi.aws.com"
  parameters = {
    basePath = "/dynamic_provisioning"
    directoryPerms = "777"
    # fileSystemId = "fs-0243f88b27131fcef"
    fileSystemId = aws_efs_file_system.efs_st.id
    provisioningMode = "efs-ap"
  }
}

output "efssc" {
  value = "storage_class : ${var.storage_class_name}" 
}

##################################################
# resource "kubectl_manifest" "storage_class" {
#   count      = var.create_storage_class ? 1 : 0
#   yaml_body  = <<YAML
# kind: StorageClass
# apiVersion: storage.k8s.io/v1
# metadata:
#   name: ${var.storage_class_name}
#  parameters:
#    directoryPerms: 700
#    fileSystemId: ${aws_efs_file_system.efs_st.id}
#    provisioningMode: efs-ap
# provisioner: efs.csi.aws.com
# YAML
#   depends_on = [aws_efs_file_system.efs_st]
# }

##################################################
# resource "kubernetes_storage_class" "gp3" {
#   metadata {
#     name = "gp3"
#   }
#   storage_provisioner = "ebs.csi.aws.com"
#   volume_binding_mode = "WaitForFirstConsumer"
#   reclaim_policy = "Delete"
#   parameters = {
#     type = "gp3"
#   } 
#   allowed_topologies {
#     match_label_expressions {
#       key = "topology.ebs.csi.aws.com/zone"
#       values = [
#         "ap-northeast-2a",
#         "ap-northeast-2c"
#       ]
#     }
#   }
# }
