# Useful links
Manual how to use eksctl
<https://eksctl.io/>

Option for configuring terraform vpc module 
<https://github.com/terraform-aws-modules/terraform-aws-vpc>

Kubernetes example demo app tytorial
<https://kubernetes.io/docs/tutorials/stateless-application/guestbook>

Documentation for alb ingress controller
<https://github.com/kubernetes-sigs/aws-alb-ingress-controller>

# FAQ
If your application not deploying on **aws eks fargate**, with an error `no node for scheduling`,  
and inside aws eks cluster you see `node fargate-null` when you doing `kubectl get pods -o wide`.  
Please check requirement tags <https://docs.aws.amazon.com/eks/latest/userguide/network_reqs.html>
and set `enable_dns_hostnames   = true` for eks cluster vpc. 

If you have an eror with **aws alb ingress controller for fargate.**

Example: 
`E1230 16:11:36.758961       1 controller.go:217] kubebuilder/controller "msg"="Reconciler error" "error"="failed to build LoadBalancer configuration due to retrieval of subnets failed to resolve 2 qualified subnets. Subnets must contain the kubernetes.io/cluster/\u003ccluster name\u003e tag with a value of shared or owned and the kubernetes.io/role/elb tag signifying it should be used for ALBs Additionally, there must be at least 2 subnets with unique availability zones as required by ALBs. Either tag subnets to meet this requirement or use the subnets annotation on the ingress resource to explicitly call out what subnets to use for ALB creation. The subnets that did resolve were []"  "controller"="alb-ingress-controller" "request"={"Namespace":"default","Name":"frontend"}`

You should set `target-type: ip` for configuration fargate alb ingress controller
