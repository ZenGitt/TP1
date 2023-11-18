resource "aws_vpc" "pk1" {
  cidr_block = "10.69.0.0/16"

  tags = {
    Name = "app1"
    Service = "application1"
    Owner = "Chewbacca"
    Planet = "Mustafar"
  }
}
