

pipeline {
    agent any
    stages {
        stage('CMD') {
            steps {
                sh "gradle help --scan"
            }
        }
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh "node sonarqube"
                }
            }
        }
    }
}