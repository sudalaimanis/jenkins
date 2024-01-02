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
        sh 'docker build -t sudalaimmanis/demosu .'
      }
    }
       stage('Push') {
      steps {
        sh 'docker push sudalaimmanis/demosu'
      }
    }
  }
  post {
    always {
      sh 'docker images'
    }
  }
}
