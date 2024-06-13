resource "aws_instance" "demoinstance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  availability_zone      = var.availability_zone
  key_name               = var.key_name
  subnet_id              = element(var.subnet_ids, 1)  # Select the first subnet ID
  vpc_security_group_ids = [aws_security_group.example.id]

  tags = var.tags
}

resource "aws_ebs_volume" "ebsvolume" {
  availability_zone = var.availability_zone
  size              = var.volume_size

  tags = var.volume_tags
}

resource "aws_volume_attachment" "ebsattachment" {
  device_name = var.device_name
  volume_id   = aws_ebs_volume.ebsvolume.id
  instance_id = aws_instance.demoinstance.id
}
