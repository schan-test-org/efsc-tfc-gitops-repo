
replicaCount: ${replica_count}

#image:
#  repository: amazon/aws-efs-csi-driver
#  repository: 602401143452.dkr.ecr.ap-northeast-2.amazonaws.com/eks/aws-efs-csi-driver
#  tag: "v1.3.8"
#  pullPolicy: IfNotPresent

controller:
  create: true
  logLevel: 2
  extraCreateMetadata: true
  tags:
    region: ${region}
    env: ${env}
  deleteAccessPointRootDir: false
  serviceAccount:
    create: true
    name: ${service_account_name}
    annotations:
      eks.amazonaws.com/role-arn: ${service_account_arn}

%{if resources != "" ~}
  resources: 
    ${indent(4, resources)}
%{ endif ~}

%{if affinity != "" ~}
  affinity: 
    ${indent(4, affinity)}
%{ endif ~}

%{if node_selector != "" ~}
  nodeSelector: 
    ${indent(4, node_selector)}
%{ endif ~}

%{if tolerations != "" ~}
  tolerations:
    ${indent(4, tolerations)}
%{ endif ~}

%{if topology_spread_constraints != "" ~}
  topologySpreadConstraints:
    ${indent(4, topology_spread_constraints)}
%{ endif ~}