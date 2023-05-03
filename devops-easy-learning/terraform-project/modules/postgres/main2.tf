#module
## Terraform block
terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Provider Block
provider "aws" {
  region = local.aws_region
}

locals {
  name         = "nes"
  engine       = "postgres"
  instance_class = "db.t2.micro"
  engine_version = "10.20"
  allocated_storage = "20"
  max_allocated_storage = "50"
  aws_region    = "us-east-1"
  instance_type = "t2.micro"
  key_name      = "WinKey"
   multi_az               = false
  publicly_accessible     = false
  deletion_protection     = false
  storage_encrypted       = true
  storage_type            = "gp2"

    common_tags = {
    "AssetID"       = "2560"
    "AssetName"     = "Insfrastructure"
    "Environment"   = "dev"
    "Project"       = "nes"
    "CreateBy"      = "Terraform"
    "cloudProvider" = "aws"
   

  }
}
terraform {
  backend "s3" {
    bucket         = "2560-dev-nes-terraform-state"
    key            = "postgres/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "2560-dev-nes-terraform-state-lock"
  }
}





module "rds_postgresql" {
  source = "../../../modules/postgres"

  name         = local.name
  engine       = local.engine
  engine_version = local.aws_engine_version
  instance_class = local.instance_class
  multi_az               = local.multi_az
  publicly_accessible     = local. publicly_accessible
  deletion_protection     = local.deletion_protection
  storage_encrypted       = local.storage_encrypted
  storage_type            = local.storage_type

  username     =data.aws_secretsmanager_secret.rds_username
  password     = data.aws_secretsmanager_secret.rds_password.id
  allocated_storage = local.allocated_storage.id
  max_allocated_storage = local.max_allocated_storage
  vpc_id            = aws_vpc.main.id
  subnets           = [local.private_subnets_db[0] ,local.private_subnets_db[1]]
  security_groups   = ["aws_security_group.nes-postgres-db-sg.id"]
}
