locals {
  service_account_policy_name = format("%s-efs-policy", var.eks_cluster_name)
  service_account_role_name   = format("%s-efs-role", replace(var.eks_cluster_name, "_", "-"))
  service_account_name        = format("%s-efs-sa", replace(var.eks_cluster_name, "_", "-"))

  efs_controller =  templatefile("${path.module}/template/efs_controller.tpl", {
    service_account_name = local.service_account_name 
    service_account_arn  = aws_iam_role.efs.arn

    region             = var.region
    env                = var.env
    replica_count      = var.replica_count
    resources          = var.resources
    affinity           = var.affinity
    node_selector      = var.node_selector
    tolerations        = var.tolerations
    topology_spread_constraints = var.topology_spread_constraints   
  })

  efs_node =  templatefile("${path.module}/template/efs_node.tpl", {
    service_account_name = local.service_account_name 
    service_account_arn  = aws_iam_role.efs.arn
  })
}
