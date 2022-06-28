pipeline {
  
  agent any
  
  stages {
    stage("Build image") {
      steps {
        echo 'Building image...'
      }
    }
    
    stage("Push image") {
      steps {
        echo 'Pushing image...'
      }
    }

    stage("Deploy image") {
      steps {
        echo 'Deploying image...'
          withCredentials([
            usernamePassword(credentials: 'docker-creds', usernameVariable: USER, passwordVariable: PASS)
          ]) {
              sh "docker deploy -u ${USER} -p ${PASS}"
             }
      } 
    }
  }
  
  post {
    always {
      echo 'Pipeline finished'
    }

    success {
      echo 'Pipeline completed successfully'
    }

    failure {
      echo 'Failure occured'
    }
  }
}
