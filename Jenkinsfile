pipeline {
     agent {
        label {
        label "built-in"
        customWorkspace "/project"
        }
    }
    
    stages{
        stage("clone the Repo") {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/parag-vyas/assess.git']]])
                }
            }
        stage ("Build Image") {
            steps{
                dir('/project'){
                    sh 'docker build -t 24121986/ubuntu1 .' 
                    }
                }
            }
        stage ("Push the Image to Dockerhub") {
            steps {
            script{
                withCredentials([string(credentialsId: '24121986', variable: 'dockerhub')]) {
                sh 'docker login -u 24121986 -p${dockerhub}'   
                   }
                sh "docker push 24121986/ubuntu1"
                }
            }
        }
    }
}
