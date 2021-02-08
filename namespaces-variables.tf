variable "namespaces" {
  type        = list(string)
  description = "List of namespaces to be created in our EKS Cluster."
  default     = ["sample-apps"]
}
