provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "${var.region}"
}

resource "aws_instance" "my-machine" {
    ami = "ami-f0b11187"
    instance_type = "t2.micro"
    subnet_id = "subnet-0b94547c"

    provisioner "local-exec" {
        command = "echo ${aws_instance.my-machine.public_ip} > file.txt"
    }
}

resource "aws_eip" "ip" {
    instance = "${aws_instance.my-machine.id}"
    depends_on = ["aws_instance.my-machine"]
    vpc = true
}
