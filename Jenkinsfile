pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my_django_app'
        DOCKER_TAG = 'latest'
        DJANGO_SETTINGS_MODULE = 'school_app.settings'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Amenigharbi/Django_project.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${DOCKER_TAG}")
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").inside {
                        sh 'pytest'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").inside {
                        sh 'python manage.py migrate'
                        sh 'python manage.py collectstatic --noinput'
                    }
                }
            }
        }

        stage('Debug') {
            steps {
                script {
                    sh 'docker info'
                    sh 'docker ps -a'
                    sh 'docker images'
                }
            }
        }
    }

    post {
        always {
            script {
                try {
                    sh 'docker system prune -f'
                } catch (Exception e) {
                    echo "Failed to clean up Docker images"
                }
            }
        }
    }
}