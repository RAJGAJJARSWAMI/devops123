pipeline {
    agent any
    
    stages{
        stage("clone the Repo") {
            steps {
                sh "rm -rf *"
                sh "git clone https://github.com/parag-vyas/assess.git"
                }
            }
        stage ("Build Image") {
            steps{
                dir('/var/lib/jenkins/workspace/Project-Assess/assess'){
                    sh 'docker build -t 24121986/ubuntu1 .' 
                    }
                }
            }
        stage ("Push the Image to Dockerhub") {
            steps {
            script{
                withCredentials([string(credentialsId: '24121986', variable: 'dockerhub')]) {
                sh 'docker login -u 24121986 -p${dockerhub}'   
                    echo "test"
                   }
                sh "docker push 24121986/ubuntu1"
                }
            }
        }
    }
}
