terraform {
  backend "s3" {
    bucket = "my-terraform-tfstate-infra-provision-through-jenkins-server"
    key = "main"
    region = "us-east-1"
    dynamodb_table = "my-dynamo-db-table-tf"
  }
}
