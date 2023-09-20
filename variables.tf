variable "region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "availability_zones" {
  description = "Availability zones for subnets"
  type        = list(string)
  default     = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
}

variable "kubernetes_version" {
  description = "EKS Kubernetes version"
  default     = "1.27"
}
