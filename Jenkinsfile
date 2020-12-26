pipeline {
  environment {
    registry = "thangpham7793/sample_jenkins_pipeline"
    DOCKER_PWD = credentials('docker-login-pwd')
  }
  agent {
    docker {
      image 'thangpham7793/jenkins-docker-test'
      args '-p 3000:3000'
      args '-w /app'
      args '-v /var/run/docker.sock:/var/run/docker.sock'
    }
  }
  options {
    skipStagesAfterUnstable()
  }
  stages {
    stage('Build') {
      steps {
        sh 'npm i'
      }
    }
    stage('Test') {
      steps {
        sh 'npm test'
      }
    }
    stage('Build & Push Docker Image') {
      steps {
        sh 'docker image build -t $registry:$BUILD_NUMBER'
        sh 'docker login -u thangpham7793 -p $DOCKER_PWD'
        sh 'docker image push $registry:$BUILD_NUMBER'
        sh 'docker image rm $registry:$BUILD_NUMBER'
      }
    }
    stage('Deploy and Smoke Test') {
      steps {
        sh './jenkins/scripts/deploy.sh'
      }
    }
    stage('Clean up') {
      steps {
        sh './jenkins/scripts/cleanup.sh'
      }
    }
  }
}