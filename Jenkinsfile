pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'my_django_app'
        DOCKER_TAG = 'latest'
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


        stage('Deploy') {
            steps {
                script {
                    // Déployer l'application
                    docker.image("${DOCKER_IMAGE}:${DOCKER_TAG}").inside {
                        sh 'python manage.py migrate'
                        sh 'python manage.py collectstatic --noinput'
                    }
                }
            }
        }
    }

    post {
        always {
            sh 'docker system prune -f'
        }
    }
}
