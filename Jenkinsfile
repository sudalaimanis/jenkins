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
        sh 'sudo docker build -t krishnansai/demosu .'
      }
    }
       stage('Push') {
      steps {
        sh 'sudo docker push krishnansai/demosu'
      }
    }
  }
  post {
    always {
      sh 'sudo docker images'
    }
  }
}
