pipeline {
     agent any
     
    stages{
        stage("clone the Repo") {
            steps {
                sh "rm -rf *"
                sh "git clone https://github.com/RAJGAJJARSWAMI/devops123.git"
                   }
            }
        stage ("Build Image") {
            steps{
                dir("/var/lib/jenkins/workspace/Project/assess"){
                    sh 'docker build -t rajgajjar/devops1234 .' 
                    }
                }
            }
        stage ("Push the Image to Dockerhub") {
            steps {
            script{
                withCredentials([string(credentialsId: '24121986', variable: 'dockerhub')]) {
                sh 'docker login -u rajgajjar -p${dockerhub}'   
                   }
                sh "docker push rajgajjar/devops1234"
                }
            }
        }
		stage ("Deploying to kubernetes") {
			steps {
			dir ("/var/lib/jenkins/workspace/Project/assess") {
			    sshagent(['58af5faf-0a89-4fc7-8f62-c825e50f68b5']) {
                    sh "scp -o StrictHostKeyChecking=no deploy.yml ubuntu@172.31.13.48:"
                    /** sh "ssh  ubuntu@172.31.13.48 kubectl delete -f ." */				    
                    script{
                        try{
                            sh "ssh -o StrictHostKeyChecking=no ubuntu@172.31.13.48 kubectl apply -f ."
                        }catch(error){
                            sh "ssh ubuntu@172.31.13.48 kubectl create -f ."
                        }
                        }
                    }
                }
		}
        }
    }
}
