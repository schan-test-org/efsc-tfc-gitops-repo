#####################################################################
# create file system - data
resource "aws_efs_file_system" "efs_st" {
  count      = var.create_efs_file_system ? 1 : 0
  creation_token   = var.file_system_list.efs_st.name
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = true

  tags = merge (
     local.common_tags,
     tomap({ "Name" = var.file_system_list.efs_st.name })
   )
  # 수명 주기 관리
  # lifecycle_policy {
  #   transition_to_ia = "AFTER_30_DAYS"
  # }

}

# create mount targets - data
resource "aws_efs_mount_target" "efs_st" {
  count = var.create_efs_file_system ? length(var.subnet_ids) : 0
  file_system_id  = aws_efs_file_system.efs_st[*].id
  # file_system_id  = aws_efs_file_system.efs_st.id
  subnet_id       = var.subnet_ids[count.index]
  security_groups = [aws_security_group.efs.id]
}

output "file_system__data" {
  value = var.create_efs_file_system ? "${var.file_system_list.efs_st.name}" : null
}


#####################################################################
# create file system - dynamic_test
# resource "aws_efs_file_system" "dynamic_test" {
#   creation_token   = var.file_system_list.dynamic_test.name
#   performance_mode = "generalPurpose"
#   throughput_mode  = "bursting"
#   encrypted        = true

#   tags = merge (
#      var.common_tags,
#      tomap({ "Name" = var.file_system_list.dynamic_test.name })
#    )
# }

# # create mount targets - mzc-a10-dev-data
# resource "aws_efs_mount_target" "dynamic_test" {
#   count = length(var.subnet_ids)

#   file_system_id  = aws_efs_file_system.dynamic_test.id
#   subnet_id       = var.subnet_ids[count.index]
#   security_groups = [aws_security_group.efs.id]
# }

# output "file_system__dynamic_test" {
#   value = "${var.file_system_list.dynamic_test.name}: ${aws_efs_file_system.dynamic_test.id}"
# }
