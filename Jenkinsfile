pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
              checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/adisharma96/weather-app/']])
            }
        }
        stage('Build Image') {
            steps {
                script {
                    docker.build("adisharma96/weather-app:jenkins")
                }
            }
       }
        stage('Push Image') {
            steps {
               withCredentials([string(credentialsId: 'ce52f7d9-4200-4e0b-b959-9673256d24b6', variable: 'dockerhubpass')]) {
               sh 'sudo docker login -u adisharma96 -p ${dockerhubpass}'
               }
               sh 'sudo docker push adisharma96/weather-app:jenkins'
            }
        }
    
        stage('Deploy Container') {
             steps {
                 sh 'sudo docker pull adisharma96/weather-app:jenkins'
                 sh 'sudo docker run -itd --name weather-app --rm -p 8082:3000 adisharma96/weather-app:jenkins'
                 sh 'sudo docker container ls'
             }
        }
    }
} 
