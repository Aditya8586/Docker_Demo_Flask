pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('Docker-cred')  // Jenkins credentials ID
        DOCKER_IMAGE = "aditya8823/calc"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/Aditya8586/Docker_Demo_Flask.git'
            }
        }
		stage('Debug Credentials') {
            steps {
                echo "Using credentials ID: dockerhub-cred-id"
                echo "Docker Hub username: ${env.DOCKERHUB_CREDENTIALS_USR}"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $DOCKER_IMAGE:${BUILD_NUMBER} ."
            }
        }

        stage('Push to Docker Hub') {
            steps {
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
                sh "docker push $DOCKER_IMAGE:${BUILD_NUMBER}"
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh "kubectl set image deployment/flask-calculator-deployment flask-calc=$DOCKER_IMAGE:${BUILD_NUMBER} --record"
            }
        }
    }
}
