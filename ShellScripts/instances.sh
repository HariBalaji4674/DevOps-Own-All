#!/bin/bash
Servers=("web" "mongodb" "catalogue" "redis" "user" "cart" "mysql" "shipping" "rabbitmq" "payment" "dispatch")
InstanceType=""
Image_id=ami-03265a0778a880afb
Sec_Group=sg-07af39f9bad6f7e41
Domain_Name=

for i in "${Servers[0]}"
do 
    if [[ $i == "mongodb" || $i == "mysql" ]]
    then
        InstanceType="t3.medium"
    else
        InstanceType="t2.micro"
    fi
    echo "Name of the Server_$i"
    IPAddr=$(aws ec2 run-instances --image-id $Image_id  --instance-type $InstanceType --security-group-ids $Sec_Group --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')
    echo "Created Server : $i --> $IPAddr"
done
