resource "aws_security_group" "sg" {

vpc_id = "${aws_vpc.vpc.id}"

name = "security-group"

description = "Allow SSH and http and https"

ingress {

from_port = 22

to_port = 22

protocol = "tcp"

cidr_blocks = ["0.0.0.0/0"]

}

egress {

from_port = 22

to_port = 22

protocol = "tcp"

cidr_blocks = ["0.0.0.0/0"]

}

egress {
from_port = 0
to_port = 0
protocol = "-1"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 8
to_port = 0
protocol = "icmp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = 80
to_port = 80
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
egress {
from_port = 443
to_port = 443
protocol = "tcp"
cidr_blocks = ["0.0.0.0/0"]
}
ingress {
from_port = 3306
to_port = 3306
protocol = "TCP"
cidr_blocks = ["10.0.2.0/24"]
}
egress {
from_port = 3306
to_port = 3306
protocol = "tcp"
cidr_blocks = ["10.0.2.0/24"]
}

tags = {
Name = "KPMG_Devops_Project securitygroup"
}
}
