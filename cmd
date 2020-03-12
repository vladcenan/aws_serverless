cd live/dev
  terragrunt init
  terragrunt plan
  terragrunt apply --auto-approve
  terragrunt destroy --auto-approve

cd aws_spec
  rspec spec/*
