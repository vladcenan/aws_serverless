# aws_serverless

Demo

## Features

* Live controller that will separate environments and override attributes;
* Creates an AWS Secret Manager secret;
* Creates a secret Lambda Function that will decrypt the secret_key;
* Creates a two Lambda Functions that will get the secret lambda input;
* Creates a Step Function that will orchestrate Lambda Functions;
* Creates a Cloud Watch Event that will trigger the Step Function;
* Creates IAM Roles and Policies;
* AWS Spec Tests.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
| awsRegion | Name of the AWS Region | string | n/a | yes |
| environment | Name of the Environment eg: dev, qa, prd | string | n/a | yes |

## Prerequisite

* Terraform v0.12.20
* Terragrunt v0.22.3
* ruby 2.6.5p114
  * rspec (3.9.0) gem
  * awspec (1.18.5) gem
* aws credentials (~/.aws/credentials & ~/.aws/config)

## ChangeLog

* v1.1.0 - add spec tests
* v1.0.0 - initialize the serverless project
