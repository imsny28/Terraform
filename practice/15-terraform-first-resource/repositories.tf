
resource "github_repository" "terraform_first_repo" {
  name = "terraform-first-repo"
  # description = "Created the terraform first repo using git plugin / provider"
  visibility = "public"
  auto_init  = true
}

# resource "github_repository" "terraform_second_repo" {
#   name        = "terraform-second-repo"
#   description = "Created the terraform second repo using git plugin / provider"
#   visibility  = "public"
#   auto_init   = true
# }



output "terraform-first-repo-url" {
  value = github_repository.terraform_first_repo.http_clone_url
}

output "terraform-first-repo-reponame" {
  value = github_repository.terraform_first_repo.full_name
}

