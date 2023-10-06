#!/bin/bash
Servers=("web" "mongodb" "catalogue" "redis" "user" "cart" "mysql" "shipping" "rabbitmq" "payment" "dispatch")

for i in "${Servers[@]}"
do 
    echo "Name of the Server_$i"
done
