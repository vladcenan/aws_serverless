#!/bin/sh
#
# This script is an interactive wrapper around terragrunt intended for use during official Terraform releases.
set -eu

ENVIRONMENT='dev'
BASE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LIVE="live/$ENVIRONMENT"
TEST='aws_spec'

cd "$BASE/$LIVE" && terragrunt init
cd "$BASE/$LIVE" && terragrunt plan
cd "$BASE/$LIVE" && terragrunt apply --auto-approve

cd "$BASE/$TEST" && rspec spec/*

# tear down serverless infrastruture
# cd "$BASE/$LIVE" && terragrunt destroy --auto-approve
