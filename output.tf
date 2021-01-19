output "aws_instance_ip" {
  value = aws_instance.base.public_ip
}

output "password_data" {
  value=aws_instance.base.password_data
}

output "password_decrypted" {
  value=rsadecrypt(aws_instance.base.password_data, file("~/.ssh/demo.pem") ) 
}