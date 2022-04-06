variable "project_name" {
  default     = "Sample Terraform Project"
  description = "Name of Azure DevOps project"
}

variable "description" {
  default     = "Description of Terraform Project that will be created."
  description = "Name of Azure DevOps project"
}

variable "visibility" {
  default = "private"
  #Options private, public
  description = "Visibility of Azure DevOps project. This can be private or public."
}

variable "version_control" {
  default = "Git"
  #Options Git, Tfvc
  description = "Version control option that will be used. This can be Git or Tfvc."
}

variable "work_item_template" {
  default = "Agile"
  #Options Agile, Basic, CMMI, Scrum
  description = "Work item template for the project. This can be Agile, Basic, CMMI or Scrum."
}

variable "build_name" {
  default = "Agile"
  #Options Agile, Basic, CMMI, Scrum
  description = "Name of Azure DevOps project build pipeline."
}

variable "repo_name" {
  default = "Imported Repo"
  #Options Agile, Basic, CMMI, Scrum
  description = "Name of Azure DevOps repository created as part of this deployment."
}

variable "repo_source_url" {
  default = "Agile"
  #Options Agile, Basic, CMMI, Scrum
  description = "URL to be used to create ADO repository."
}