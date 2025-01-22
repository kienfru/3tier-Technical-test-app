### **A. How to Initialize and Apply the Terraform Configuration:**
1.  **Prerequisites**:
    *   Install Terraform and AWS CLI.
    *   Set up AWS credentials using `aws configure` or environment variables.
2.  **Steps**:
    1.  **Clone or Download Terraform Files**: Download the files into your project directory.
        
    2.  **Initialize Terraform**: Run the following command to initialize Terraform:
        
        `terraform init`
        
    3.  **Review the Plan**: Create an execution plan to review the changes that will occur:

        `terraform plan -out=tfplan`
        
    4.  **Apply the Configuration**: After confirming the changes, apply them:

        `terraform apply tfplan`
        
    5.  **Verify Infrastructure**: Log in to the AWS Management Console to verify that the infrastructure is set up as expected.
        

### **B. Resource Hierarchy and Purpose**:

1.  **VPC (`technical-test-vpc`)**:
    *   A virtual network within AWS that enables communication between all the infrastructure components.
2.  **Subnets**:
    *   **Public Subnet (`technical-test-public`)**:
        *   Contains resources that need to be directly accessible from the internet (e.g., frontend EC2).
    *   **Private Subnet (`technical-test-private`)**:
        *   Contains resources that should not be directly accessible from the internet (e.g., backend EC2, Redis).
3.  **Internet Gateway (`technical-test-internet-gateway`)**:
    *   Allows resources in the public subnet to access the internet.
4.  **NAT Gateway (`technical-test-nat-gateway`)**:
    *   Allows resources in the private subnet to access the internet indirectly (through the public subnet).
5.  **Elastic IP (`technical-test-nat-eip`)**:
    *   Static IP address associated with the NAT Gateway for internet access.
6.  **Routing Table (`technical-test-routing-table`)**:
    *   Defines how traffic should be routed between the subnets and the internet. The routing table connects:
        *   Public Subnet to the Internet Gateway.
        *   Private Subnet to the NAT Gateway.
7.  **Security Groups**:
    *   These are firewall rules that control the traffic allowed to and from the EC2 instances and Redis.