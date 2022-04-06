# Note that this example should import the GitHub Repo for this code into Azure DevOps. However, it appears as though this is still not fully supported.
# Also at this time only public repos are supported for import.
#
resource "azuredevops_git_repository" "imported_repo" {
  project_id = azuredevops_project.terraform_ado_project.id
  name       = var.repo_name
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = var.repo_source_url
  }
}

# resource "azuredevops_git_repository" "repo" {
#   project_id = azuredevops_project.project.id
#   name       = "Sample Import an Existing Repository"
#   initialization {
#     init_type             = "Import"
#     source_type           = "Git"
#     source_url            = "https://dev.azure.com/example-org/private-repository.git"
#     service_connection_id = azuredevops_serviceendpoint_generic_git.serviceendpoint.id
#   }
# }