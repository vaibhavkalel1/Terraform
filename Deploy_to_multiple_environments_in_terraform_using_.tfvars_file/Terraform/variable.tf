variable "env" {
    description = "The environment name for the resources"
    type        = string
}

variable "instance_type" {
    description = "The type of EC2 instance"
    type        = string
    default     = "t2.micro"  # You can change this if needed
}
