#Add LB DNS endpoint
output "LB-DNS-NAME" {
  value = aws_lb.application-lb.dns_name
}

#Add DNS Register for jenkins
output "url" {
  value = aws_route53_record.jenkins.fqdn
}

#aws_la_cloudplayground_multiple_workers_version

output "amiId-us-east-1" {
  value = data.aws_ssm_parameter.linuxAmi.value
}

output "amiId-us-west-2" {
  value = data.aws_ssm_parameter.linuxAmiOregon.value
}
output "Jenkins-Main-Node-Public-IP" {
  value = aws_instance.jenkins-master.public_ip
}
output "Jenkins-Main-Node-Private-IP" {
  value = aws_instance.jenkins-master.private_ip
}
output "Jenkins-Worker-Public-IPs" {
  value = {
    for instance in aws_instance.jenkins-worker-oregon :
    instance.id => instance.public_ip
  }
}
output "Jenkins-Worker-Private-IPs" {
  value = {
    for instance in aws_instance.jenkins-worker-oregon :
    instance.id => instance.private_ip
  }
}
