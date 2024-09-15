packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "packer-image"
  instance_type = "t2.micro"
  region        = "eu-central-1"
  source_ami    = "ami-0e04bcbe83a83792e"
  ssh_username  = "ubuntu"
}


build {
  name    = "ansible-role"
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install software-properties-common -y",
      "sudo add-apt-repository --yes --update ppa:ansible/ansible",
      "sudo apt-get install ansible -y",
      "ansible-galaxy collection install devsec.hardening"
    ]
  }

  provisioner "ansible-local" {
    playbook_file = "./playbook.yaml"
  }

}