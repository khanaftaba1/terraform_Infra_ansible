######################################### Key pair
resource "aws_key_pair" "asg_key" {
  key_name   = "asg-key"
  public_key = file("./my_key.pub")
}
