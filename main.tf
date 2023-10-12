terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  /*cloud {
    organization = "Scott-Private"

    workspaces {
      name = "terra-house-1"
    }
  }*/
}

provider "terratowns" {
    endpoint = var.terratowns_endpoint
    user_uuid = var.teacherseat_user_uuid
    token = var.terratowns_access_token
}

module "terrahouse_aws" {
  source              = "./modules/terrahouse_aws"
  user_uuid           = var.teacherseat_user_uuid
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version     = var.content_version
  assets_path         = var.assets_path
}

resource "terratowns_home" "home"{
  name = "Scott B test"
  description = <<DESCRIPTION
Scott b Test Descr

  DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "34dad.cloudfront.net"
  town = "missingo"
  content_version = 3
}