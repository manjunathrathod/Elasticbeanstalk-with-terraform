provider "aws" {
  region = "${var.region}"
  version = " ~> 2.42.0"
}

resource "aws_s3_bucket" "dist_bucket" {
  bucket = "${var.bucket_name}"
  acl    = "private"
}
resource "aws_s3_bucket_object" "dist_item" {
  key    = "test-distribution"
  bucket = "${aws_s3_bucket.dist_bucket.id}"
  source = "nodejs-v3.zip"
}
resource "aws_elastic_beanstalk_application" "manju-nodejs-demo" {
  name = "${var.application_name}"
}

resource "aws_elastic_beanstalk_environment" "manju-nodejs-demo-test" {
  name = "${var.environment_name}"
  application = "${var.application_name}"
  solution_stack_name = "${var.solution_stack}"
  cname_prefix = "${var.cname_prefix}"
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }
}

resource "aws_elastic_beanstalk_application_version" "default" {
  name        = "sample-application"
  application = "${var.application_name}"
  description = "application version created by terraform"
  bucket      = "${aws_s3_bucket.dist_bucket.id}"
  key         = "${aws_s3_bucket_object.dist_item.id}"
}