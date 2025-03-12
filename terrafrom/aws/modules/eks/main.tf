
provider "" {
    backend "s3" {
        bucket = "astronomy-tf-eks-state-bucket"
        key    = "terraform-eks-state-locks"
        region = "ca-central-1"
    }
}


