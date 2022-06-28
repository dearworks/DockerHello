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
        echo 'Pushing image...'
      }
    }

    stage("Run image") {
      steps {
        echo 'Removing any running containers'
        sh 'docker rm -vf docker-hello'
        echo 'Running image....'
        // sh "docker run --name docker-hello -d -p 8888:80 mantasme/docker-hello"
        sh "docker compose up"
      } 
    }
  }
  
  post {
    always {
      echo '*** PIPELINE ENDED ***'
      echo ''
      echo 'Running containers:'
      sh 'docker ps'
    }

    success {
      echo 'Pipeline completed successfully'
    }

    failure {
      echo 'Failure occured'
    }
  }
}
