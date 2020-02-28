
Elasticbeanstalk with Terraform with a nodejs example

Step1: Need to have AWS account and user with minimum policy to create the elastic beanstalk application. In my case I have created a user with admin access and generated accesskey and secretkey.

Step2: Need Terraform to be installed. You can find how to install terraform in here(https://learn.hashicorp.com/terraform/getting-started/install.html).  Export accesskey and secretKey.

export AWS_ACCESS_KEY_ID=(your access key id)
export AWS_SECRET_ACCESS_KEY=(your secret access key)

Step3. Go to the file where we have terraform main.tf file and “terraform init” and “terraform apply”. The terraform will create the Elastic beanstalk application, Elastic beanstalk environment and S3 bucket with object stored with application code.
The sample application in my example code is used is an Nodejs example from aws site. You can find it in here(https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/tutorials.html).

 This sample code of terraform creates Elastic beanstalk application, Elastic beanstalk environment and S3 bucket rest ELB itself takes care of running the application on EC2 instance in default VPC, Creates security Groups ,EC2 launch configuration, Autoscaling Group, Load-balancer and Providing DNS with Route53.
Step4: To deploy the Changes made to nodejs application. Just zip the code and reference name of zip file in main.tf file and follow Step3.
Step5: To destroy the environment run “terraform destroy”.


Further Improvement. 

1. To have specified Security Group, VPC, Subnets, Instance Profile,  ASG min and max number specification etc, we can use the setting option and update the all the parameters of our choice.

2. If we have any new application code and to deploy it on ELB you need to follow below tasks.

 2.1: Build jar/war or zip file of the application and use the terraform code to build the same.

3. The above task can made into run in and Jenkins pipeline. A pipeline can have Create, Deploy and Destroy option to perform the Job. The Jenkins can integrated with Git and then automatically we can command Jenkins pipeline to clone the application code and use for deployment.
