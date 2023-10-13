terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  cloud {
    organization = "Scott-Private"

    workspaces {
      name = "garth-brooks-terrahome"
    }
  }
}

provider "terratowns" {
    endpoint = var.terratowns_endpoint
    user_uuid = var.teacherseat_user_uuid
    token = var.terratowns_access_token
}

module "home_garth_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.garth.public_path
  content_version = var.garth.content_version
}

resource "terratowns_home" "home_garth" {
  name = "About Garth Brooks"
  description = <<DESCRIPTION
Troyal Garth Brooks, born on February 7, 1962, in Tulsa, Oklahoma, is a prominent figure in the music industry. Notable facts about him include:

- Garth Brooks holds a unique record in music history, having released nine albums certified Diamond by the Recording Industry Association of America, surpassing The Beatles' previous record of six.
- Garth Brooks is one of the world's best-selling music artists, having sold over 170 million records. "Billboard" ranked him as the greatest male solo artist on the "Billboard" 200 chart of all time.
DESCRIPTION
  domain_name = module.home_garth_hosting.domain_name
  town = "melomaniac-mansion"
  content_version = var.garth.content_version
}


/*
This is how we would set up a second home
module "home_REPLACEME_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.REPLACEME.public_path
  content_version = var.REPLACEME.content_version
}

resource "terratowns_home" "home_REPLACEME" {
  name = "Replace Me"
  description = <<DESCRIPTION
Replace me
DESCRIPTION
  domain_name = module.home_REPLACEME_hosting.domain_name
  town = "REPLACEME"
  content_version = var.REPLACEME.content_version
}

*/