# capstone project

Overview:
The project deploys a tiny app: cgiserver.py (server that can run any
  of the scripts in the cgi-bin subdirectoy directory) to the following
  runtime environments:
  - locally
  - a minikube kubernetes cluster (using Docker Desktop)
  - an AWS EKS kubernetes cluster

 An example use would be to run:
  local:
    http://localhost:8081/cgi-bin/get-info
  EKS cluster:
    http://a130af0e261cb4cad909bbd1d02d74d5-446101963.eu-west-2.elb.amazonaws.com:8000/cgi-bin/get-info
  In both cases they return details about the runtime host, IP address, userId etc.
  When running in a cluster, just keep refreshing URL and it's a useful way to confirm that requests are 
  being directed to each of the containers.

Repositories:
All source code is stored in GitHub @ https://github.com/peteh-automation/capstone
Docker images are stored in Docker Hub @ https://hub.docker.com/repository/docker/peterheybrock/capstone

Helper scripts:
- Makefile & local/run_docker.sh that builds & tests the image locally
- minikube/run_kubernetes that tests the image in a minikube cluster
- eks/create_cluster.sh that sets up the cluster infrastructure using
    AWS EKS & AWS CloudFormation
- kubernetes/deploy_app.sh
            /deploy_lb.sh
            /delete_app.sh
            /delete_lb.sh
    that create and tear down the pods/containers and the load balancer

Configuration files:
- .circleci/config.yml defines a CicleCI CI/CD pipeline that does
  the following:
  - lints the python CGI server script
  - builds a Docker image
  - uploads the image to Docker Hub
  - deploys the new image to the EKS Kubernetes cluster of three nodes
    using a rolling deployment
- eks/capstone.yml defines the cluster infrastructure
- kubernetes/deployment.yml
            /service.yml

N.B. I created the AWS EKS cluster using the AWS IAM role capstone-admin
and operated the cluster e.g. updating the deployment image, using 
AWS IAM user capstone, which had permissions to assume the capstone-admin
role

Included screenshots:
- lint-failure.jpg & lint-success.jpg
- rolling-update.jpg
