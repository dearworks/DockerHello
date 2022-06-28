pipeline {
  
  agent any
  
  environment {
    JENKINS_DOCKER_CREDS = credentials('jenkins-docker-creds')
  }
  
  stages {
    stage("Build image") {
      steps {
        echo 'Building image...'
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
        sh "docker run --name docker-hello -d custom-nginx"
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
