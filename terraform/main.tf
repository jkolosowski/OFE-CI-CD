terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.40.0"
    }

    external = {
      source  = "hashicorp/external"
      version = "~> 2.3.3"
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region = "eu-central-1"
}

module "perf" {
  source = "./modules/perf"

  lambda_function_name = "website_perf_check"

  # Important - adjust lambda path to your project structure
  lambda_source_dir = "${path.root}/../lib/lambda-perf"

}
