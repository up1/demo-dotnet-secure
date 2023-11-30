pipeline {
    agent {
        label 'node01'
    }

    stages {
        stage('Code') {
            steps {
                git branch: 'main', url: 'https://github.com/up1/demo-dotnet-secure.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker compose down'
                sh 'docker compose build'
            }
        }
        stage('Deploy') {
            steps {
                sh 'API_PORT=8083 docker compose up -d'
            }
        }
        stage('API test') {
            steps {
                sh 'rm -rf api-test-report/*.xml'
                sh 'docker compose up api_test --abort-on-container-exit --build'
            }
            post {
                always {
                    junit 'api-test-report/*.xml'
                }
            }
        }
        stage('Load test') {
            steps {
                echo 'TODO'
            }
        }
    }
}