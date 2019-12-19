resource "aws_eks_fargate_profile" "demo-profile" {
  cluster_name           = aws_eks_cluster.demo.name
  fargate_profile_name   = "demo-profile"
  pod_execution_role_arn = aws_iam_role.terraform-eks-fargate.arn
  subnet_ids             = module.vpc.private_subnets

  tags = {
     manage = "warkshop"
   }
           
  selector {
    namespace = "kube-system"
  }

  selector { 
    labels = {
      worker = "fargate"
    }    
    namespace = "default" 
  }
}
