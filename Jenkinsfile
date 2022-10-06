pipeline {
    agent any 

    stages {
        stage('Do a dry-run') {
            steps {
                sh "ansible-playbook robot-dryrun.yml -e ansible_user=centos -e ansible_password=DevOps321 -e COMPONENT=mongodb -e ENV=dev"
            }
        }
    }
}