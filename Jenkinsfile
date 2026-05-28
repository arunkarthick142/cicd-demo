
pipeline {
    agent any

    environment {
        IMAGE_NAME = "cicddemo"
        CONTAINER_NAME = "cicd-container"
    }

    stages {

        stage('Clone Repository') {
            steps {
                echo 'Cloning source code...'
                checkout scm
            }
        }

        stage('Build Maven Project') {
            steps {
                echo 'Building Maven project...'
                sh 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh 'docker build -t $IMAGE_NAME .'
            }
        }

        stage('Stop Existing Container') {
            steps {
                echo 'Stopping old container if running...'

                sh '''
                docker stop $CONTAINER_NAME || true
                docker rm $CONTAINER_NAME || true
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'

                sh '''
                docker run -d -p 8081:8080 --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }

    }

    post {

        success {
            echo 'CI/CD Pipeline Executed Successfully!'
        }

        failure {
            echo 'Pipeline Failed!'
        }

    }
}

