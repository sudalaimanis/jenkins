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
        sh 'sudo docker build . -t sudalaimmanis/demosu'
      }
    }
       stage('Push') {
      steps {
        sh 'sudo docker push sudalaimmanis/demosu'
      }
    }
  }
  post {
    always {
      sh 'sudo docker images'
    }
  }
}
