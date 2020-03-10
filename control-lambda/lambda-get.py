import boto3
import json

def lambda_handler(event, context):
  try:
    print(event[0])
    ids = [event[0], event[1]]
    return ids
  except Exception as e:
    raise e
  else:
    print('Done')
