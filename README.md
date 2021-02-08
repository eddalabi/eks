

The usage of official Terraform modules brings us simplicity of coding AWS components following the best practices from verified providers

<h1>Requirements</h1>
AWS Account, with programatic access. We will use these credentials to configure some environment variables later.
Terraform CLI or Terraform Cloud. In this document we use 0.13 version,

<h2>Terraform Configuration</h2>
<p>VPC</p>
The file vpc.tf creates a vpc where will isolate our EKS resources with subnets on each avaialbilty zones, a single nat gateway and tags required by EKS.

<h2>EKS Cluster</h2>

The eks-cluster.tf file creates the following resources:

An EC2 autoscaling group for Kubernetes, composed by Spot instances autoscaled out/down based on CPU average usage.
An EKS cluster, with two groups of users (called “admins” and “developers”).
An EC2 https://github.com/aws/aws-node-termination-handler for Kubernetes, which takes care of reallocating Kubernetes objects when Spot instances get automatically terminated by AWS. This installation uses Helm to ease things up.
And we also define some Kubernetes/Helm Terraform providers, to be used later to install & configure stuff inside our Cluster using Terraform code.

<p>Load Balancer</p>
The ingress.tf file -  The creation of the ELB will be handled by a new Kubernetes Service deployed through a Helm Chart of an Nginx Ingress deployment:

As you may see above, the Ingress definition uses a new AWS-issued SSL certificate to provide HTTPS in our ELB to be put in front of our Kubernetes pods, and also defines some annotations required by Nginx Ingress for EKS. At the end it creates a new DNS entry associated with the ELB, which in this example depends on a manually-configured DNS Zone in Route53.

Note: In this case I decided to re-use a DNS Zone created outside of this Terraform workspace (defined in “dns_base_domain” variable). That is the reason why we are using a data source to fetch an existing Route53 zone instead of creating a new resource. Feel free to change this if required, and create new DNS resources if you do not have any already.

<p>DNS</p>
The dns.tf file - creates some DNS subdomains associated with our EKS Cluster, which will be used by the Ingress Gateway to route requests to specific applications using DNS subdomains

<p>Kubernetes Namespaces</p>
The namespaces.tf file - is to define some Kubernetes namespaces to separate our Deployments and have better management & visibility of applications in our Cluster

RBAC Access
The rbac.tf file - this configuration block grants access to see some Kubernetes objects (like pods, deployments, ingresses and services) as well as executing commands in running pods and create proxies to local ports.

APP Deployment
The folder App/ deploys a very small container into our new Kubernetes Cluster using Helm

where;

      KUBERNETES_CLUSTER = my-app-eks
      APP_NAME           = sample-app
      KUBERNETES_NAMESPACE = sample-apps
      
      Use Helm to deploy sample app to kubernetes cluster
    - aws eks --region ${AWS_DEFAULT_REGION} update-kubeconfig
      --name ${KUBERNETES_CLUSTER}
    - helm upgrade --install ${APP_NAME} --namespace ${KUBERNETES_NAMESPACE}
      helm/ --values helm/config/values-development.yaml
