################################################################################
# Enter list of participants 
# NEEDS TO BE UPDATED FOR EVERY CLASS
# COPY/PASTE FROM EXAMPLE
# [ "Instructor", "Student1", "Student2", "Student3", "Student4", "Student5", 
# "Student6", "Student7", "Student8", "Student9", "Student10", 
# "Student11", "Student12", "Student13", "Student14", "Student15", 
# "Student16", "Student17", "Student18", "Student19", "Student20", 
# "Student21", "Student22", "Student23", "Student24", "Student25", 
# "Student26", "Student27", "Student28", "Student29", "Student30" ]
################################################################################
variable "participants" {
  description = "Name of Participants"
  type        = list(string)
  default     = ["Instructor", "Student1", "Student2", "Student3", "Student4"]
}

################################################################################
# Enter your username
# NEEDS TO BE UPDATED FOR EVERY CLASS
################################################################################
variable "contact_tag_value" {
  description = "Contact Information"
  type        = string
  default     = "thompson"
}

################################################################################
# Enter your initials
# NEEDS TO BE UPDATED FOR EVERY CLASS
################################################################################
variable "contact_initials" {
  description = "Contact initials"
  type        = string
  default     = "SRT"
}

################################################################################
# AWS region
variable "aws_region" {
  description = "The name of the region in the instance will live"
  type        = string
  default     = "us-east-1"
}

################################################################################
# Instance types
variable "workstation_instance_type" {
  description = "The instance type"
  type        = string
  default     = "t3.large"
}

variable "apache_instance_type" {
  description = "The instance type"
  type        = string
  default     = "t3.micro"
}

variable "lb_instance_type" {
  description = "The instance type"
  type        = string
  default     = "t3.micro"
}

variable "iis_instance_type" {
  description = "The instance type"
  type        = string
  default     = "t2.micro"
}

variable "automate_instance_type" {
  description = "The instance type"
  type        = string
  default     = "t3.large"
}

################################################################################
# AMI names
variable "workstation_ami_name" {
  description = "The name of the aws ami needed to be spun up"
  type        = string
  default     = "ami-093bfe3ce05427cad"
}

variable "lb_ami_name" {
  description = "The name of the aws ami needed to be spun up"
  type        = string
  default     = "ami-0448247a34a8cb2bb"
}

variable "apache_ami_name" {
  description = "The name of the aws ami needed to be spun up"
  type        = string
  default     = "ami-0448247a34a8cb2bb"
}

variable "iis_ami_name" {
  description = "The name of the aws ami needed to be spun up"
  type        = string
  default     = "ami-4a80ac20"
}

variable "automate_ami_name" {
  description = "The name of the aws ami needed to be spun up"
  type        = string
  default     = "ami-094ce7994320d988c"
}

################################################################################
# IAM role required for workstation
variable "aws_iam_role" {
  description = "role needed for test-kitchen"
  type        = string
  default     = "test-kitchen"
}

################################################################################
# Security group for EC2s
variable "aws_security_group" {
  description = "Security Group"
  type        = list(string)
  default     = ["all-open"]
}
