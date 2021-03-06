import boto3
import base64
import json
import os
import time
from botocore.exceptions import ClientError

def get_secret():
  secret_name   = os.environ['secrets_manager_name']
  region_name   = os.environ['aws_region']
  endpoint_name = ${secrets_manager_endpoint}

  # Create a Secrets Manager client
  session = boto3.session.Session()
  client = session.client(
    service_name = 'secretsmanager',
    region_name  = region_name,
    endpoint_url = endpoint_name
  )

  try:
    get_secret_value_response = client.get_secret_value(
      SecretId=secret_name
    )

  except ClientError as e:
    if e.response['Error']['Code'] == 'DecryptionFailureException':
      raise e
    elif e.response['Error']['Code'] == 'InternalServiceErrorException':
      raise e
    elif e.response['Error']['Code'] == 'InvalidParameterException':
      raise e
    elif e.response['Error']['Code'] == 'InvalidRequestException':
      raise e
    elif e.response['Error']['Code'] == 'ResourceNotFoundException':
      raise e
    print(e)
  else:
    if 'SecretString' in get_secret_value_response:
      secret = get_secret_value_response['SecretString']
      return secret
    else:
      decoded_binary_secret = base64.b64decode(get_secret_value_response['SecretBinary'])
      return decoded_binary_secret

def parse_secret():
  secret_key = get_secret()
  key = json.loads(secret_key)
  return key

def connection():
  # return id
  guid1 = "${uuid1}"
  guid2 = "${uuid2}"
  return(guid1, guid2)

def lambda_handler(event, context):
  key = parse_secret()
  mongo_admin_user = key["username"]
  mongo_admin_pass = key["password"]
  try:
    guid = connection()
    ids = [guid]
    #return(guid)
    return {
      'statusCode': 200,
      'body': json.dumps("--user "+mongo_admin_user+" -password "+mongo_admin_pass)
    }
  except Exception as e:
    raise e
  else:
    print('Done')
