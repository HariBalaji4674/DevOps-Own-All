#!/bin/bash
#Creating Ec2 Instance Through AWS CLI

#Setting Debug Mode:
set -x 

#Stating The Script 
echo "Starting Script"

#Fierst Create A Arrays Of Servers/Instances
EC2_NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payments" "dispatch" "web")

for i in "${EC2_NAMES[0]}"
do
    echo "Name : $i"
done

