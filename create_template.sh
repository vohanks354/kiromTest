oc delete template dc-latihan1
oc create -f dc-latihan1.yaml
oc new-app --template dc-latihan1 -p APPLICATION_NAME=app-latihan1