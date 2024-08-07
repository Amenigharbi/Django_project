pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my_django_app'
        DOCKER_TAG = 'latest'
        DJANGO_SETTINGS_MODULE = 'school_app.settings'
        DOCKER_HUB_CREDENTIALS = ''
        DOCKER_HUB_REPO = ''
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_HUB_CREDENTIALS}") {
                        def customImage = docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                        customImage.push("${DOCKER_TAG}")
                    }
                }
            }
        }

    }

    
}
