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
                    docker.build("${DOCKER_IMAGE}")
                    docker.tag("${DOCKER_IMAGE}") amenigharbi/"${DOCKER_IMAGE}:${DOCKER_TAG}"
                }
            }
        }
        stage('deploy in Docker Hub') {          
            steps {
              script {
                   withCredentials([string(credentialsId: 'dockerHub', variable: 'dockerHub')])
                  {   
                   sh 'docker login -u amenigharbi -p ${dockerhubpwd}'
                   sh  'docker push amenigharbi/${DOCKER_IMAGE}:${DOCKER_TAG}'
                  }       
              }
        }


        }
}
