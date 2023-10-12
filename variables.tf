variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}
variable "teacherseat_user_uuid" {
  type = string
}

variable "garth" {
  type = object({
    public_path = string
    content_version = number
  })
}

/*
This is how we would do a second home
variable "replace_me" {
  type = object({
    public_path = string
    content_version = number
  })
}

*/