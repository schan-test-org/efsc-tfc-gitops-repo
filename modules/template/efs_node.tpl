node:
  logLevel: 2
  dnsPolicy: ClusterFirst
  dnsConfig: {}
  podAnnotations: {}
  nodeSelector: {}
  serviceAccount:
    create: false
    name: ${service_account_name}
    annotations:
      eks.amazonaws.com/role-arn: ${service_account_arn}