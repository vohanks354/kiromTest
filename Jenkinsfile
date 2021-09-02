node{
    stage('Create App'){
        sh 'oc project mgs-jenkins-red'
        sh 'oc create -f docker-template.yaml'
    }
}