pipeline { 
    parameters{
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
    }
    
    environment{
        AWS_ACCESS_KEY = credentials('AWS_ACCESS_KEY')
        AWS_SECRET_KEY = credentials('AWS_SECRET_KEY')
    }

    agent {label 'slave-01'}

    stages {
        stage('checkout') { 
            steps { 
                dir("terraform")
                {
                    git "https://github.com/dhruvinmaniar123/devops-jenkins"
                }
            }
        }
        stage('init and plan'){
            steps{
                sh 'sudo apt update ; sudo apt install terraform'
                sh 'pwd;cd terraform ; terraform init'
                sh 'pwd;cd terraform ; terraform workspace new ${environment}'
                sh 'pwd;cd terraform ; terraform workspace select ${environment}'
                sh "pwd;cd terraform ; terraform plan -input=false -out tfplan ; terraform show -no-color tfplan > tfplan.txt"
                
            }
        }
        stage('Apply'){
            input{
                message "Are you sure you want to apply this plan?"
            }
            steps{
                sh "pwd;cd terraform ; terraform apply -input=false tfplan"
            }
        }
    }
    post {
        always {
            archiveArtifacts artifacts: 'tfplan.txt'
        }
}
}

