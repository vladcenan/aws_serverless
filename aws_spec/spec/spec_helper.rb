require 'awspec'

#Awsecrets.load(secrets_path: File.expand_path('./secrets.yml', File.dirname(__FILE__)))
Aws.config.update({
  region: 'us-east-1'
})

@cloud_watch = ['dev-cw-event']
@sfn_name = ['dev-sfn']
