variable "region" {
    default = "eu-west-2"
    description = "AWS region for creating resources"
}

variable "bucket_name" {
    default = "manju-elb-dist"
}

variable "application_name" {
    default = "manju-nodejs-demo"
}

variable "environment_name" {
    default = "manju-nodejs-demo-test"
}

variable "solution_stack" {
    default = "64bit Amazon Linux 2018.03 v4.13.0 running Node.js"
}

variable "cname_prefix" {
    default = "manju-sample-app"
}