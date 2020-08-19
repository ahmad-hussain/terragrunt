# Terragrunt will copy the Terraform configurations specified by the source parameter, along with any files in the
# working directory, into a temporary folder, and execute your Terraform commands in that folder.
terraform {
   source = "git@github.com:ahmad-hussain/terraform-modules.git//dashboards/team-dashboards"
}

# Include all settings from the root terragrunt.hcl file
include {
  path = find_in_parent_folders()
}


# # These are the variables we have to pass in to use the module specified in the terragrunt configuration above
inputs = {
    DATADOG_API_KEY             = yamldecode(sops_decrypt_file("${find_in_parent_folders("secrets.yaml")}"))["datadog"]["apiKey"]
    DATADOG_APP_KEY             = yamldecode(sops_decrypt_file("${find_in_parent_folders("secrets.yaml")}"))["datadog"]["appKey"]
    create_datadog              = true
    warning_uptime              = 99.85
    warning_recovery_uptime     = 99.86
    critical_uptime             = 99.7
    critical_recovery_uptime    = 99.71
    warning_response            = 0.85
    warning_recovery_response   = 0.84
    critical_response           = 1
    critical_recovery_response  = 0.99
    target_uptime               = 99.8
    target_response             = 0.8
    timeframe_uptime            = "30d"
    timeframe_response          = "30d"
    apm_name                    = "bruh"
    owner                       = "team1"
}
