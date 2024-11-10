# devops-infra
Repo containing code to set up the and eks cluster on aws.

## requirements
Set up repository secrets named AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY

## remote-state-setup
main.tf - You need to run this file once in order to create a bucket and a table for future use for a remote Terraform state. 
## root dir
* terraform.tf - Used to tell Terraform to use the bucket and table we created as a backend for the state file.
* main.tf - Defines the name of the cluster and region, selects 2 availability zones and creates 2 private subnets and 2 public ones.
Also enabled nat gateway, marks public subnets for loab balancer and sets up an internal lb in the private subnets.
* eks-al2023.tf - Defines a cluster with t2.medium machines with al2023 image, with public access to the api, the current user becomes an admin of the cluster and we also define a shut down grace period (taken from the example).

  
non trivial stuff: 
* cluster_endpoint_public_access = true was needed
* `"kubernetes.io/cluster/eks-michaels" = "shared"` public subnet tag was needed for lb to work
## github actions
init, validate and plan on PR, and apply on push to main
