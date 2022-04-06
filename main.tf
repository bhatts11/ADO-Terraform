terraform {
  required_providers {
    azuredevops = {
      source  = "microsoft/azuredevops"
      version = ">=0.1.0"
    }
  }
}

provider "azuredevops" {
  version = ">= 0.0.1"
  # Remember to specify the org service url and personal access token details below
  org_service_url       = "https://dev.azure.com/org/"
  personal_access_token = "xxxxxxxxxxxxxxxxx7mje6l45guj5feeua"
}

resource "azuredevops_project" "terraform_ado_project" {
  name               = var.project_name
  description        = var.description
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.work_item_template
  # Enable or desiable the DevOps fetures below (enabled / disabled)
  features = {
    "boards"       = "enabled"
    "repositories" = "enabled"
    "pipelines"    = "enabled"
    "testplans"    = "enabled"
    "artifacts"    = "enabled"
  }
}


resource "azuredevops_build_definition" "DeployPipeline" {
  project_id = azuredevops_project.terraform_ado_project.id
  name       = var.build_name
  #agent_pool_name = "Hosted Ubuntu 1604"

  ci_trigger {
    use_yaml = true
  }

  # variable_groups = [
  #   azuredevops_variable_group.varGroup.id
  # ]

  repository {
    repo_type   = "TfsGit"
    repo_id     = azuredevops_git_repository.imported_repo.id
    branch_name = azuredevops_git_repository.imported_repo.default_branch
    yml_path    = "azure-pipelines.yml"
  }
}