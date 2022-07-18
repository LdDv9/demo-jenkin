

pipeline {
    agent any
    stages {
        stage('CMD') {
            steps {
                sh "sh gradle help --scan"
            }
        }
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh "./gradlew sonarqube"
                }
            }
        }
    }
}