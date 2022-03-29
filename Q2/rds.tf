resource "aws_db_subnet_group" "dbsubnet" {
name = "main"
subnet_ids = ["${aws_subnet.private_subnet1.id}" , "${aws_subnet.private_subnet.id}"]
tags = {
Name = "My DB subnet group"
}
}

#provision the database
resource "aws_db_instance" "wpdb" {
identifier = "wpdb"
instance_class = "db.t2.micro"
allocated_storage = 20
engine = "mysql"
db_name = "wordpress_db"
password = "mypassword"
username = "zippyops"
skip_final_snapshot = true
db_subnet_group_name = "${aws_db_subnet_group.dbsubnet.name}"
vpc_security_group_ids = ["${aws_security_group.db.id}"]
# Workaround for Symphony
lifecycle {
ignore_changes = [engine, auto_minor_version_upgrade, vpc_security_group_ids]
}
}


resource "aws_security_group" "db" {
name = "db-secgroup"
vpc_id = "${aws_vpc.vpc.id}"

# ssh access from anywhere
ingress {
from_port = 3306
to_port = 3306
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
}