#!/bin/bash
#set project in the work place
#use gcloud config set project "Project ID"
# export assigned zone into MY_ZONE
export MY_ZONE=us-central1-a

#start a cluster named webfrontend
gcloud container clusters create webfrontend --zone $MY_ZONE --num-nodes 2

#Check installed Kubernetes Version
kubectl version

#launch a single instance of the nginx container
kubectl create deploy nginx --image=nginx:1.17.10

#view Pods running in the nginx container
kubectl get pods

#expose the nginx container to the internet 
kubectl expose deployment nginx --port 80 --type LoadBalancer

#view the new service
kubectl get services
echo "Use the displyed IP to test and contact the nginx container remotely"

#Scale the number of pods
kubectl scale deployment nginx --replicas 3

#Update the number of pods
kubectl get pods

#Confirm Ip no changed
kubectl get services