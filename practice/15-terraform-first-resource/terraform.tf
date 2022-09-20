# terraform plan - actually use
# terraform providers
# terraform init
# terraform apply
# terraform apply --auto-approve
# terraform destroy

# Delete specific resource
# terraform destroy --target github_repository.terraform_second_repo 

# check the confg
# terraform validate

# sync with providers with tf files 
# terraform refresh


# terraform output terraform-first-repo-url


# terraform console

# for proper indention
# terraform fmt

# The terraform taint command manually marks a Terraform-managed resource as tainted, forcing it to be destroyed and recreated on the next apply.
# terraform taint aws_security_group.allow_tls

# The output of terraform graph is in the DOT format, which can easily be converted to an image by making use of dot provided by GraphViz:
# terraform graph | dot -Tsvg > graph.svg
# terraform graph | dot -Tpdf > graph.pdf
