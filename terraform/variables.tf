variable "project_id" {}

variable "region"     { 
    default = "us-central1" 
}

variable "zone"       {
     default = "us-central1-a" 
}

variable "ssh_private_key_path" {
  description = "Path to your private SSH key for connecting to the VM"
}
