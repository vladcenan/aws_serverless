import boto3
import json

def lambda_handler(event, context):
  try:
    print(event['body'][1])
  except Exception as e:
    raise e
  else:
    print('Done')
