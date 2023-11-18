resource "aws_lb" "pk1_alb" {
  name               = "pk1-load-balancer"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.pk1-sg02-LB01.id]
  subnets            = [
    aws_subnet.public-us-east-1a.id,
    aws_subnet.public-us-east-1b.id,
    aws_subnet.public-us-east-1c.id
  ]
  enable_deletion_protection = false
#Lots of death and suffering here, make sure it's false

  tags = {
    Name    = "pk1LoadBalancer"
    Service = "pk1"
    Owner   = "User"
    Project = "Web Service"
  }
}

resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.pk1_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.pk1_tg.arn
  }
}
