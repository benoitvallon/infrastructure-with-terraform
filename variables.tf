variable "access_key" {}
variable "secret_key" {}
variable "region" {
    default = "eu-west-1"
}
variable "amis" {
    default = {
        eu-west-1 = "ami-f0b11187"
        eu-central-1 = "ami-b43503a9"
    }
}

output "ip" {
    value = "${aws_eip.ip.public_ip}"
}
