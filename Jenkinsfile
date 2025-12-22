pipeline {
    agent any

    environment {
        // GCP service account JSON stored in Jenkins credentials
        GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account')

        // CHANGE THIS to your GCP project id
        PROJECT_ID = "alert-flames-477310-k5"    
}

    stages {

        stage('Checkout') {
            steps {
                // git 'https://github.com/git-learn3/gcp-terraform.git'
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
    post {
        success {
            echo "Terraform pipeline completed successfully"
        }
        failure {
            echo "Terraform pipeline failed"
        }
    }
}
