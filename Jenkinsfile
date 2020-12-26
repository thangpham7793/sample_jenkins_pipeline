pipeline {
  // environment {
  //   registry = "thangpham7793/sample_jenkins_pipeline"
  //   DOCKER_PWD = credentials('docker-login-pwd')
  // }
  // agent {
  //   docker {
  //     image 'thangpham7793/jenkins-docker-test'
  //     args '-v /var/run/docker.sock:/var/run/docker.sock'
  //   }
  // }
  // options {
  //   skipStagesAfterUnstable()
  // }
  agent any
    options {
        skipStagesAfterUnstable()
    }
    stages {
        stage('Build') {
            steps {
                echo 'Building'
            }
        }
        stage('Test') {
            steps {
                echo 'Testing'
            }
        }
        stage('Deploy to Staging') {
            steps {
                echo 'Deploy to Staging'
            }
        }
        stage('Deploy to Production') {
            steps {
                echo 'Deploy to Production'
            }
        }
    }
}