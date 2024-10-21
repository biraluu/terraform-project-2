module "ec2_k3s" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = "k3s"
    instance_type = "t2.micro"
    ami = "ami-001f2488b35ca8aad"
    subnet_id = module.vpc.private_subnets[0]
    vpc_security_group_ids = [aws_security_group.allow_ssh_http_https.id]
    user_data = file("k3s.sh")

    tags = {
        Name = "k3s"
    }
}

module "ec2_bastion" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = "bastion"
    instance_type = "t2.micro"
    ami = "ami-001f2488b35ca8aad"
    subnet_id = module.vpc.private_subnets[0]
    vpc_security_group_ids = [aws_security_group.allow_ssh_http_https.id]

    tags = {
        Name = "bastion"
    }
}