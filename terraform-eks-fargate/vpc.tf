module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name = "vpc-module-demo"
  cidr = "192.168.0.0/16"

  azs             = slice(data.aws_availability_zones.available.names, 0, 3)
  private_subnets = ["192.168.96.0/19", "192.168.128.0/19", "192.168.160.0/19"]
  public_subnets  = ["192.168.0.0/19", "192.168.32.0/19", "192.168.64.0/19"]

  enable_nat_gateway     = true
  single_nat_gateway     = true
  one_nat_gateway_per_az = false
  enable_vpn_gateway     = false

  tags = {
    "Name"                                      = "terraform-eks-demo-node"
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
  }
}

