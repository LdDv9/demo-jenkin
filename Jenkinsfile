

pipeline {
    agent any
    stages {
        stage('Clone sources') {
            steps {
                git branch: 'main', url: 'https://github.com/LdDv9/demo-jenkin.git'
            }
        }
        stage('pwd') {
            steps {
                sh "pwd"
            }
        }
        stage('whoami') {
            steps {
                sh "whoami"             
            }
        }

        stage('Scan code by SonarQube') {
            steps {
                sh "/opt/sonar-scanner/bin/sonar-scanner \
                    -Dsonar.projectKey=demo \
                    -Dsonar.sources=. \
                    -Dsonar.host.url=http://sonarqube:9000 \
                    -Dsonar.login=sqp_bcec6fbf88def678c3b3ffda45ff04e49152b79d"
            }
        }
        stage('Build & push docker image') {
            steps {
                sh "ID=\$(docker build -q -t localhost:8082/repository/docker-nexus .)"
                sh "timestamp=\$(date +%s)"
                sh "docker tag $ID localhost:8082/repository/docker-nexus:\$timestamp"
                sh "docker push localhost:8082/repository/docker-nexus:\$timestamp"
                sh "echo DONE!!!"
            }
            
        }
    }
}
