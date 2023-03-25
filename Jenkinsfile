pipeline {
  agent any
  environment {
    DOCKER_HUB = credentials('DOCKER_HUB')
    DOCKER_IMAGE_NAME = 'sonroyaalmerol/cc_comp367_almerol_lab3'
  }

  stages {
    stage('Check out') {
      steps {
        git branch: 'main', url: 'https://github.com/sonroyaalmerol/comp367_lab2_q3.git'
      }
    }
    
    stage('Build maven project') {
      steps {
        sh 'mvn clean install'
      }
    }
    
    stage('Unit test') {
      steps {
        sh 'mvn test'
      }
    }
    
    stage('Docker build') {
      steps {
        script {
          sh 'docker build -t $DOCKER_IMAGE_NAME .'
        }
      }
    }

    stage('Docker login') {
      steps {
        script {
          sh 'docker login -u $DOCKER_HUB_USR -p $DOCKER_HUB_PSW'
        }
      }
    }

    stage('Docker push') {
      steps {
        script {
          sh 'docker push $DOCKER_IMAGE_NAME'
        }
      }
    }

    stage('Docker logout') {
      steps {
        script {
          sh 'docker logout'
        }
      }
    }
  }
}
