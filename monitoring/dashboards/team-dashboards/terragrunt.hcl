# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
  source = "git@github.com:ahmad-hussain/terraform-modules.git//dashboards/team-dashboards"
}

# dependency needs to be added to the service as well.  It should come up to this level ../../../../../monitoring/dashboards

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}

# These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
  owner                        = "bruh"
  DATADOG_API_KEY        = yamldecode(sops_decrypt_file("${find_in_parent_folders("secrets.yaml")}"))["datadog"]["apiKey"]
  DATADOG_APP_KEY        = yamldecode(sops_decrypt_file("${find_in_parent_folders("secrets.yaml")}"))["datadog"]["appKey"]
  pods                         = [
                                    {
                                      name = "Team1"
                                      services = [
                                        "bruh1",
                                        "bruh2"
                                      ]
                                    },
                                    {
                                      name = "Team2"
                                      services = [
                                        "owo"
                                      ]
                                    }
                                 ]
}
