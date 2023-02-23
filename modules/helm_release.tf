resource "helm_release" "aws-efs-csi-driver" {
  name             = var.helm_release_name
  chart            = var.helm_chart_name
  version          = var.helm_chart_version
  repository       = var.helm_repository_url

  create_namespace = var.create_namespace
  namespace        = var.namespace

  values = [
    # controller
    local.efs_controller,

    # node
    local.efs_node,
  ]

  depends_on = [
    aws_iam_role.efs
  ]
}