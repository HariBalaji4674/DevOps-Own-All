#!/bin/bash
#Creating Ec2 Instance Through AWS CLI

#Setting Debug Mode:
set -x 

#Stating The Script 
echo "Starting Script"

#Fierst Create A Arrays Of Servers/Instances
EC2_NAMES=("mongodb" "redis" "mysql" "rabbitmq" "catalogue" "user" "cart" "shipping" "payments" "dispatch" "web")

#Setting Image id below
Image_id=ami-03265a0778a880afb

#Setting Security Group
Sec_Group=sg-07af39f9bad6f7e41


for i in "${EC2_NAMES[@]}"
do
    echo "Name : $i"
done

