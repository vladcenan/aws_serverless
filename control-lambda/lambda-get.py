import boto3
import json

def lambda_handler(event, context):
  try:
    print(event['body'][0])
    ids = [event['body']]
    return ids
  except Exception as e:
    raise e
  else:
    print('Done')
