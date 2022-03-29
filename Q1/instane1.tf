resource "aws_instance" "nginx" {
ami = "ami-0c02fb55956c7d316"
instance_type = "t2.micro"
monitoring = true
vpc_security_group_ids = ["${aws_security_group.sg.id}"]
subnet_id = "${aws_subnet.public_subnet.id}"
associate_public_ip_address = true
tags = {
Name = "KPMG_Devops_Project"
}
user_data = <<EOF
#!/bin/bash
yum update -y
sudo amazon-linux-extras install epel -y
yum update -y
yum install wget -y
yum install nginx -y
yum install git -y
service nginx start
rm -rf "/etc/nginx/nginx.conf"
cd "/etc/nginx/"
wget https://raw.githubusercontent.com/Tamilvananb/nginx.conf/master/nginx.conf
systemctl restart nginx
EOF
}