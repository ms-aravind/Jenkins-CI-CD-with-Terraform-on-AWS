pipeline {

  agent any

  environment {

     AWS_ACCESS_KEY_ID = credentials('ee47e6c6-9514-4409-a7ba-eda981ec3116')
     AWS_SECRET_ACCESS_KEY = credentials('ee47e6c6-9514-4409-a7ba-eda981ec3116')

  }

  stages {
    stage('Checkout Code') {
      steps {
        git branch: 'main',
            url: 'https://github.com/ms-aravind/Jenkins-CI-CD-with-Terraform-on-AWS.git'
      }
    }

    stage('Initialize Terraform') {
       steps {
         sh 'terraform init'
       }
    }

    stage('Plan Terraform') {
      steps {
        sh 'terraform plan'
      }
     }

     stage('Apply Terraform') {
       steps {
         sh 'terraform apply -auto-approve'
        }
      }
     stage('Destroy Terraform') {
       steps {
         sh 'terraform destroy -auto-approve'
       }
      }
    }
}
