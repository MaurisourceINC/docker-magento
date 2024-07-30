variable "main_instance_type" {
  type    = string
  default = "t2.large"
}

variable "main_vol_size" {
  type    = number
  default = 12
}

variable "main_instance_count" {
  type    = number
  default = 1
}

variable "key_name" {
  type = string
}

variable "public_key" {
  type      = string
  sensitive = true
}
