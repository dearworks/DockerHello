pipeline {
  
  agent any
  
  environment {
    JENKINS_DOCKER_CREDS = credentials('jenkins-docker-creds')
  }
  
  stages {
    stage("Build image") {
      steps {
        echo 'Building image...'
        sh "docker login -u ${JENKINS_DOCKER_CREDS_USR} -p ${JENKINS_DOCKER_CREDS_PSW}"
        sh "docker build -t mantasme/docker-hello:latest -t mantasme/docker-hello:v1.0 ."
      }
    }
    
    stage("Push image") {
      steps {
        echo 'Pushing image....'
      }
    }

    stage("Running image") {
      steps {
        echo 'Running image....'
        sh "docker run --name docker-hello -d mantasme/docker-hello"
      } 
    }
  }
  
  post {
    always {
      echo '*** PIPELINE ENDED ***'
    }

    success {
      echo 'Pipeline completed successfully'
    }

    failure {
      echo 'Failure occured'
    }
  }
}
