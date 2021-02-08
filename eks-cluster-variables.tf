# create some variables
variable "admin_users" {
  type        = list(string)
  description = "List of Kubernetes admins."
  default     = ["thomas-gray", "ursula-williams"]
}

variable "developer_users" {
  type        = list(string)
  description = "List of Kubernetes developers."
  default     = ["melissa-oliver", "lex-oneil"]
}

variable "asg_instance_types" {
  type        = list(string)
  description = "List of EC2 instance machine types to be used in EKS."
  default     = ["t3.small", "t2.small"]
}

variable "autoscaling_minimum_size_by_az" {
  type        = number
  description = "Minimum number of EC2 instances to autoscale our EKS cluster on each AZ."
  default     = 2
}

variable "autoscaling_maximum_size_by_az" {
  type        = number
  description = "Maximum number of EC2 instances to autoscale our EKS cluster on each AZ."
  default     = 10
}

variable "autoscaling_average_cpu" {
  type        = number
  description = "Average CPU threshold to autoscale EKS EC2 instances."
  default     = 30
}

variable "spot_termination_handler_chart_name" {
  type        = string
  description = "EKS Spot termination handler Helm chart name."
  default     = "aws-node-termination-handler"
}

variable "spot_termination_handler_chart_repo" {
  type        = string
  description = "EKS Spot termination handler Helm repository name."
  default     = "https://aws.github.io/eks-charts"
}

variable "spot_termination_handler_chart_version" {
  type        = string
  description = "EKS Spot termination handler Helm chart version."
  default     = "0.9.1"
}

variable "spot_termination_handler_chart_namespace" {
  type        = string
  description = "Kubernetes namespace to deploy EKS Spot termination handler Helm chart."
  default     = "kube-system"
}
