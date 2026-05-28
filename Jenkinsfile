
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
                bat 'mvn clean package'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                bat 'docker build -t %IMAGE_NAME% .'
            }
        }

        stage('Stop Existing Container') {
            steps {
                echo 'Stopping old container if running...'

                bat '''
                docker stop %CONTAINER_NAME% || exit 0
                docker rm %CONTAINER_NAME% || exit 0
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                echo 'Running Docker container...'

                bat '''
                docker run -d -p 8080:8080 --name %CONTAINER_NAME% %IMAGE_NAME%
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

