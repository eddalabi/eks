# create some variables
variable "dns_base_domain" {
  type        = string
  description = "DNS Zone name to be used from EKS Ingress."
  default     = "centricity.cloud"
}

variable "ingress_gateway_chart_name" {
  type        = string
  description = "Ingress Gateway Helm chart name."
  default     = "nginx-ingress"
}
variable "ingress_gateway_chart_repo" {
  type        = string
  description = "Ingress Gateway Helm repository name."
  default     = "https://helm.nginx.com/stable"
}
variable "ingress_gateway_chart_version" {
  type        = string
  description = "Ingress Gateway Helm chart version."
  default     = "0.5.2"
}

variable "ingress_gateway_annotations" {
  type        = map(string)
  description = "Ingress Gateway Annotations required for EKS."
  default     = {
  "controller.service.httpPort.targetPort"                                                                    = "http",
  "controller.service.httpsPort.targetPort"                                                                   = "http",
  "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-backend-protocol"        = "http",
  "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-ssl-ports"               = "https",
  "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-connection-idle-timeout" = "60",
  "controller.service.annotations.service\\.beta\\.kubernetes\\.io/aws-load-balancer-type"                    = "elb"
 }
}
