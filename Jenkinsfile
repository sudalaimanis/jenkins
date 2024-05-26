pipeline {
  agent {
    docker { image 'node:16-alpine' }
  }
  environment {
    SONARQUBE_URL = 'http://your-sonarqube-server'
    SONARQUBE_CREDENTIALS = 'your-sonarqube-credentials-id'
    SONARQUBE_PROJECT_KEY = 'your-project-key'
    SONARQUBE_PROJECT_NAME = 'your-project-name'
    SONARQUBE_PROJECT_VERSION = '1.0'
  }
  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/your-repository.git'
      }
    }
    stage('Install Dependencies') {
      steps {
        sh 'npm install'
      }
    }
    stage('Unit Test') {
      steps {
        sh 'npm run test:unit'
      }
    }
    stage('Static Code Analysis') {
      steps {
        sh 'npm run lint'
      }
    }
    stage('Code Vulnerability Test') {
      environment {
        SONAR_SCANNER_HOME = tool 'SonarScanner'
      }
      steps {
        withSonarQubeEnv('SonarQube') {
          sh '''
            ${SONAR_SCANNER_HOME}/bin/sonar-scanner \
            -Dsonar.projectKey=${SONARQUBE_PROJECT_KEY} \
            -Dsonar.projectName=${SONARQUBE_PROJECT_NAME} \
            -Dsonar.projectVersion=${SONARQUBE_PROJECT_VERSION} \
            -Dsonar.sources=. \
            -Dsonar.host.url=${SONARQUBE_URL} \
            -Dsonar.login=${SONARQUBE_CREDENTIALS}
          '''
        }
      }
    }
    stage('Automation Test') {
      steps {
        sh 'npm run test:automation'
      }
    }
    stage('Deploy') {
      steps {
        sh './deploy.sh'
      }
    }
  }
  post {
    always {
      junit '**/test-results/*.xml'
      archiveArtifacts artifacts: '**/dist/*.js', allowEmptyArchive: true
    }
  }
}
