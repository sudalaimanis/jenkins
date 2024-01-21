pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  stages {
    stage('Build') {
      steps {
        sh 'ls'
        sh 'sudo docker build -t sudalaimmanis/demohtml . '
      }
    }
       stage('Push') {
      steps {
        sh 'sudo docker push sudalaimmanis/demohtml'
      }
    }
  }
  post {
    always {
      sh 'sudo docker images'
    }
  }
}
