# Configure Terragrunt to automatically store tfstate files in an S3 bucket
remote_state {
  backend = "s3"

  config = {
    region         =
    bucket         =
    key            =
    encrypt        =
    kms_key_id     =
    dynamodb_table =
  }
}

# Configure root level variables that all resources can inherit. This is especially helpful with multi-account configs
# where terraform_remote_state data sources are placed directly into the modules.
inputs = {
  aws_region         =
  tfstate_bucket     =
  tfstate_key_prefix =
  tfstate_kms_key_id =
  tfstate_lock       =
}
