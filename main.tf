################################################################################
# Places a restraint on using a specific version of terraform

terraform {
  required_version = ">= 0.12"
}

################################################################################
# All training nodes are in AWS
provider "aws" {
  region = var.aws_region
}

################################################################################
# Chef Infra Foundations - Workstation
resource "aws_instance" "workstation" {
  count                = length(var.participants)
  ami                  = var.workstation_ami_name
  instance_type        = var.workstation_instance_type
  security_groups      = var.aws_security_group
  iam_instance_profile = var.aws_iam_role

  tags = {
    Name      = "${var.contact_initials}-Foundations-Workstation"
    X-Contact = var.contact_tag_value
    Date      = formatdate("MMM DD, YYYY", timestamp())
  }
}

################################################################################
# Chef Infra Foundations - Apache
resource "aws_instance" "apache" {
  count           = length(var.participants)
  ami             = var.apache_ami_name
  instance_type   = var.apache_instance_type
  security_groups = var.aws_security_group

  tags = {
    Name      = "${var.contact_initials}-Foundations-Apache"
    X-Contact = var.contact_tag_value
    Date      = formatdate("MMM DD, YYYY", timestamp())
  }
}

###############################################################################
# Chef Infra Foundations - lb
resource "aws_instance" "lb" {
  count           = length(var.participants)
  ami             = var.lb_ami_name
  instance_type   = var.lb_instance_type
  security_groups = var.aws_security_group

  tags = {
    Name      = "${var.contact_initials}-Foundations-LB"
    X-Contact = var.contact_tag_value
    Date      = formatdate("MMM DD, YYYY", timestamp())
  }
}

################################################################################
# Chef Infra Foundations - IIS
resource "aws_instance" "iis" {
  count           = length(var.participants)
  ami             = var.iis_ami_name
  instance_type   = var.iis_instance_type
  security_groups = var.aws_security_group

  tags = {
    Name      = "${var.contact_initials}-Foundations-IIS"
    X-Contact = var.contact_tag_value
    Date      = formatdate("MMM DD, YYYY", timestamp())
  }
}

################################################################################
# Chef Infra Foundations - Automate
resource "aws_instance" "automate" {
  count           = 1
  ami             = var.automate_ami_name
  instance_type   = var.automate_instance_type
  security_groups = var.aws_security_group

  tags = {
    Name      = "${var.contact_initials}-Foundations-Automate"
    X-Contact = var.contact_tag_value
    Date      = formatdate("MMM DD, YYYY", timestamp())
  }
}
