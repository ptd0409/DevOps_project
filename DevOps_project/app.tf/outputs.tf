output "cluster_name" {
  value = module.eks.cluster_name
}

# output "kubeconfig" {
#   value = module.eks.kubeconfig
#   sensitive = true
# }

output "kubeconfig_command" {
  value = "aws eks --region ${var.aws_region} update-kubeconfig --name ${module.eks.cluster_name}"
}