# create some variables
variable "deployments_subdomains" {
  type        = list(string)
  description = "List of subdomains to be routed to Kubernetes Services."
  default     = ["sample", "api"]
}