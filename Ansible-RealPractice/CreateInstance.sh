#!/bin/bash

NAME=Demo1
INSTANCE_TYPE=t2.micro
SECURITY_GROUP=sg-07af39f9bad6f7e41
IMAGE_ID=ami-03265a0778a880afb

IP_ADDR=$(aws ec2 run-instances --image-id $IMAGE_ID  --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GROUP --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$NAME}]" | jq -r '.Instances[0].PrivateIpAddress')

echo "The Private Address is : $IP_ADDR"

