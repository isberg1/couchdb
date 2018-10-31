pipeline {
    agent {
        docker { image 'gossin/edu:pdk' }
    }
    stages {
        stage('Validate and lint') {
            steps {
                sh 'pdk validate metadata,puppet'
            }
        }
        stage('Unit tests') {
            steps {
                sh 'pdk test unit --debug'
            }
        }

    }
}
