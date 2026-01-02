terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "eu-west-2"
<<<<<<< HEAD
}
=======
}
>>>>>>> d9a3e9a979ebb016649e3053aa778d2d7dfcf080
