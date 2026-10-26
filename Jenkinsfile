pipeline {
    agent any

    tools {
        nodejs 'Node20'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                bat 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                bat 'npm test'
            }
        }

        stage('Deploy') {
            when {
                branch 'main'
            }
            steps {
                bat 'call deploy.bat'
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully - app deployed at http://localhost:8081'
        }
        failure {
            echo 'Pipeline failed - deployment skipped. Check test results above.'
        }
    }
}
