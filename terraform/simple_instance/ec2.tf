provider "aws" {
  region = "eu-central-1"
}
resource "aws_security_group" "ssh_traffic" {
  name        = "ssh_traffic"
  description = "Allow SSH inbound traffic"
  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {
    git_commit           = "1f626f72c4e4055276e6ac5b2e984be2a9bdb25d"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-15 11:41:31"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "demo_drift_detection"
    yor_trace            = "84020d4d-8e4b-4313-91b2-27f2d36d442e"
  }
}

resource "aws_instance" "web_server_instance" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.ssh_traffic.name}"]


  tags = {
    git_commit           = "1f626f72c4e4055276e6ac5b2e984be2a9bdb25d"
    git_file             = "terraform/simple_instance/ec2.tf"
    git_last_modified_at = "2021-11-15 11:41:31"
    git_last_modified_by = "63422736+rbenavente@users.noreply.github.com"
    git_modifiers        = "63422736+rbenavente"
    git_org              = "rbenavente"
    git_repo             = "demo_drift_detection"
    yor_trace            = "d448a4de-3b3f-43eb-a20f-c2442b06984a"
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}
