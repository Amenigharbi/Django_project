pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my_django_app'
        DOCKER_TAG = 'latest'
        DJANGO_SETTINGS_MODULE = 'school_app.settings'
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ${DOCKER_IMAGE} .'
                }
            }
        }
        stage('Deploy to Docker Hub') {          
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerHub', variable: 'dockerHub')]) {   
                        sh 'docker login -u amenigharbi -p ${dockerHub}'
                        sh 'docker tag ${DOCKER_IMAGE}:latest amenigharbi/${DOCKER_IMAGE}:${DOCKER_TAG}'
                        sh 'docker push amenigharbi/${DOCKER_IMAGE}:${DOCKER_TAG}'
                    }
                }
            }
        }
    }
}
