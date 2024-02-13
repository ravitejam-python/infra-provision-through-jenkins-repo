Summary: We will be learning how to provision resources in AWS cloud using Terraform and Jenkins. We will also learn how to store terraform state info remotely in AWS S3 bucket.

Youtube reference: https://www.youtube.com/watch?v=hyP3RleaQ_o

Website reference: https://www.coachdevops.com/2021/12/jenkins-pipeline-terraform-integration.html

Step 1: Since Jenkins is already provisioned through Terraform code from repo https://github.com/ravitejam-python/Jenkins-Terraform-Integration

Step 2: Create a S3 bucket manually

Step 3: Create DynamoDB table manually 

Step 4: Create IAM with EC2, S3 & DynamoDB full access and assign it to Jenkins EC2 instance

Step 5: Create a new Pipeline job in Jenkins:

Step 6: Add parameters to the pipeline (Click checkbox - This project is parameterized, choose Choice Parameter)

Add below pipeline code and modify per your GitHub repo configuration.

pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
            checkout scm
            }
        }
        
        stage ("terraform init") {
            steps {
                sh ('terraform init -reconfigure') 
            }
        }
        stage ("terraform plan") {
            steps {
                sh ('terraform plan') 
            }
        }
                
        stage ("terraform Action") {
            steps {
                echo "Terraform action is --> ${action}"
                sh ('terraform ${action} --auto-approve') 
           }
        }
    }
}


