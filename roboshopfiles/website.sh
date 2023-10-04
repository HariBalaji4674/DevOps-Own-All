#!/bin/bash

Date=$(date +%F:%H:%M:%S)
ScriptFile=$0
LogDir=/tmp
LogFile=$LogDir/$ScriptFile-$Date.log

R="\e[31m"
G="\e[33m"
N="\e[0m"
Y="\e[33m"

userid=$(id -u)
if [ $userid -ne 0 ]
then
	echo "$R ERROR:Permission Denied Please Switch to root user $N"
else
	echo "$G Success : Please Process With instalation $N "
fi 

validation(){
if [ $1 -ne 0 ]
then
	echo "$R $2 :: --> is failure The Script Please Check Log Files"
else
	echo "$G $2 :: --> Success : Please Proceed  $N "
fi
}

echo " Then Start Installing The Packages "

sudo yum install nginx -y &>> $LogFile

validation $? "The Installation of NGINX "

systemctl enable nginx &>> $LogFile

validation $? "The Enabling of NGINX "

systemctl start nginx &>> $LogFile

validation $? "The Service of NGINX "

rm -rf /usr/share/nginx/html/* &>> $LogFile

validation $? "The Files Are removed "

curl -o /tmp/web.zip https://roboshop-builds.s3.amazonaws.com/web.zip &>> $LogFile

validation $? "The downloads are completed "

cd /usr/share/nginx/html  &>> $LogFile

validation $? "Changed to /usr/share/nginx/html  "

unzip /tmp/web.zip &>> $LogFile

validation $? "After Changing Unzipping The content to "

cp roboshop.conf /etc/nginx/default.d/roboshop.conf &>> $LogFile

validation $? "Copied the conf files to default.d directory "