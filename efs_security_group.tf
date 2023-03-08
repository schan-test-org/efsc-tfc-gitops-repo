locals {
  efs_sg_name = format("%s-efs-mount-sg", var.eks_cluster_name)	
  # efs_sg_name = format("%s-%s-efs-mount-sg", var.project, var.env)	
}

resource "aws_security_group" "efs" {
  name        = local.efs_sg_name
  vpc_id      = var.vpc_id
  description = "Amazon EFS For EKS, SG For Mount Target"

  tags = merge (
    local.common_tags,
    tomap({ "Name" = local.efs_sg_name })
  )
}

resource "aws_security_group_rule" "ingress" {
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "tcp"
  security_group_id        = aws_security_group.efs.id
  cidr_blocks              = [var.vpc_cidr]
}

resource "aws_security_group_rule" "egress" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.efs.id
  cidr_blocks              = ["0.0.0.0/0"]
}