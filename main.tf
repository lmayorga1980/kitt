provider "aws" {
  region  = "us-east-1"
  profile = "demo"
}

resource "aws_eip" "instance_ip" {                  
  vpc      = true                                                      
  instance = aws_instance.base.id
}


resource "aws_instance" "base" {
  ami               = "ami-0f5761c546ea1265a"
  instance_type     = "t2.2xlarge"
  key_name          = "demo"
  user_data         = file("files/bootstrap.ps1")
  get_password_data = true

  connection {
    type     = "winrm"
    agent    = false
    port     = 5986
    user     = "Administrator"
    password = rsadecrypt(self.password_data,file("~/.ssh/demo.pem"))
    insecure = true
    use_ntlm = true
    https    = true
    timeout  = "15m"
    host     = self.public_ip
  }

  security_groups   = [
    aws_security_group.sg_allow_win.name,
    aws_security_group.sg_allow_outbound.name
  ]

  provisioner "remote-exec" {
    inline = ["powershell Get-Host"]
  }

  provisioner "local-exec" {
    command = "ansible-playbook -i ${self.public_ip},  ansible/playbook.yml"
  }

}
