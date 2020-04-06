# Project-Shadow
Portfolio 
This project is to showcase my skills utilizing various DevOps tools and methods. 

terraform {
  backend "remote" {
    organization = "NekaB"

    workspaces {
      name = "Project-Shadow"
    }
  }
}
