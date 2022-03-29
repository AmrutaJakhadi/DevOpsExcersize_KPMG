resource "aws_subnet" "private_subnet1" {

vpc_id = "${aws_vpc.vpc.id}"

cidr_block = "10.0.2.0/24"

availability_zone = "us-east-1b"

tags = {

Name = "KPMG_Devops_Project privatesubnet1"

}

}

resource "aws_route_table" "private_route_table1" {

vpc_id = "${aws_vpc.vpc.id}"

tags = {

Name = "KPMG_Devops_Project private_route1"

}

}

resource "aws_route_table_association" "private_subnet_association1" {

subnet_id = "${aws_subnet.private_subnet1.id}"

route_table_id = "${aws_route_table.private_route_table1.id}"

}