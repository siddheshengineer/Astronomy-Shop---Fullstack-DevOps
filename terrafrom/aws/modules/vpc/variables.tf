variable "vpc_cidr" {
    description = "CIDR block for VPC"
    type        = string
}

variable "availability_zone" {
    description = "Availability Zones"
    type        = list(string)  
}

variable "private_subnet_cidr" {
    description = "CIDR block for Private subnet"
    type        = list(string)
}

variable "public_subnet_cidr" {
    description = "CIDR block for Public subnet"
    type        = list(string)
}

variable "cluster_name" {
    description = "Name of EKS Cluster"
    type        = string  
}