app=catalogue
echo ${app}
dnf module disable nodejs -y
dnf module enable nodejs:20 -y
dnf install nodejs -y
cp ${app}.service /etc/systemd/system/{app}.service
cp mongo.repo /etc/yum.repos.d/mongo.repo
useradd roboshop
rm -rf /app
mkdir /app
curl -o /tmp/${app}.zip https://roboshop-artifacts.s3.amazonaws.com/${app}-v3.zip 
cd /app 
unzip /tmp/${app}.zip
cd /app 
npm install 
systemctl daemon-reload
systemctl enable catalogue 
systemctl restart catalogue
dnf install mongodb-mongosh -y
mongosh --host 10.0.0.5 </app/db/master-data.js
