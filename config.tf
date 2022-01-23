provider "aws" {
access_key = "ASIAREEYI7VFRXTVNNSC"
secret_key = "IpU2ujqVEyNLXh+rKfx1RA4Rvik8zVRcJfY4/8AY"
token = "FwoGZXIvYXdzEEMaDBdOWJp6uXoeIOfSTyK+AbiRFEeYMIWkAS1oINwWzYsuRsqNranyNVLe0gYJxn0CXFXhuFS7UUI8tcrJXRRRzTqcPZ9z6QeLxiTCKM8TmlebCGqRbIGr0e/ztcaUVhZpWUr/ymYbixC92DDPBCCofF/dqPeitpTKr8+oQ93XTVLamjQGWNzHQUvjWb7GZLmhCmX1xxPKWr4X99Tf670M4w2lldyxCRAZXyNGYqGWk8/i7cd2yFXn/hFK0C5SlpzambEEZspKf8nqlMvfZUko28G0jwYyLcKgRriTizloutbSer8+m3ATUKmQZjSlPjHHgBzLQQsoOvOyVz6oBRoa2nhI6g=="
region = "us-east-1"
}

resource "aws_instance" "instance1" {
ami = "ami-0a14be708fcb20c8e"
instance_type = "t2.micro"
key_name= "id_rsa"
vpc_security_group_ids = [aws_security_group.main.id]
tags = {
Name = "project"
}
}

resource "aws_security_group" "main" {
egress = [
{
cidr_blocks = ["0.0.0.0/0", ]
description = ""
from_port = 0
ipv6_cidr_blocks = []
prefix_list_ids = []
protocol = "-1"
security_groups = []
self = false
to_port = 0
}
]
ingress = [
{
cidr_blocks = ["0.0.0.0/0", ]
description = ""
from_port = 22
ipv6_cidr_blocks = []
prefix_list_ids = []
protocol = "tcp"
security_groups = []
self = false
to_port = 22
}
]
}

resource "aws_key_pair" "deployer"{
key_name = "id_rsa"
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDLxbMuSy14i0Rs5Jtctx5aix0jDlenE+ZxHsZMMLsLoJk6D6Q2pREqmF2u7Y/nDe8eRkNXolXhz4Hze5hrLoskKEQIyfcJfle+d1Dgglf7QvYNmCgv7Mf9p/oMw/hOoijJNCXuXA5OyUNjTQn3nqOIOrvQQaJixvGCAMwH6hIwYoU+NqvfKFugllsszx2H5m98JKpyBed8ROir+9EyStmwJ7JdnkoR2az5eneihK1hPrFlkX4VAjRch4CAvcnkO8XZjeEsatosvVFSK75Ckqpqn6ilUMfnRFzp0C5AgmdWhfEXZ16OMlCYi46daHn/nKLrELGIdKUYmoemTvvP7uSV aish@LAPTOP-Isha"
}