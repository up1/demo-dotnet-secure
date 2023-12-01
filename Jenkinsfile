pipeline {
    agent {
        label 'node02'
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
        stage('Scan code') {
            steps {
                sh 'docker compose up sonarqube --abort-on-container-exit --build'
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
                sh 'docker compose up jmeter --abort-on-container-exit --build'
            }
        }
    }
    post {
        always {
            sh 'docker compose down'
        }
    }
}