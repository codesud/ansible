pipeline {
    agent any 
    parameters {
         choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Chose the environment')
         string(name: 'COMPONENT', defaultValue: '', description: 'Enter the name of the component')
    }
    environment { 
        SSH_CRED = credentials('SSH-Centos7')
    }
    stages {
            stage('Lint Checks') {  // This will be executed against the feature branch only
             steps {
                sh "env"
                sh "echo Style Checks"
                sh "echo running is feature branch"
            }
        }

        stage('Do a dry-run') {
            steps {
                sh "env"   // Just to see tne environment variables as a part of the pipeline
                sh "ansible-playbook robot-dryrun.yml -e ansible_user=${SSH_CRED_USR} -e ansible_password=${SSH_CRED_PSW} -e COMPONENT=${params.COMPONENT} -e ENV=${params.ENV}"
            }
        }
    }
}