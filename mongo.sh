cp mongo.repo /etc/yum.repos.d/mongo.repo
dnf install mongodb-org -y 
systemctl enable mongod 
systemctl start mongod 
sed -i 's/27.0.0.1/0.0.0.0/' /etc/mongod.conf
systemctl restart mongod