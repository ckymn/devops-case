#!/bin/bash

# Define the directory containing your YAML files
YAML_DIR="/Users/muhammetcokyaman/Desktop/global/projects/devops/goodjob-devops-case/goodjob-devops-case/k8s"

# Iterate over each YAML file in the directory and apply it to the cluster
for file in $YAML_DIR/*.yaml; do
  kubectl apply -f $file
done
