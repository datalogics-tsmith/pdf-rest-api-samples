#!/bin/sh

# By default, we use the US-based API service. This is the primary endpoint for global use.
PDFA_URL="https://api.pdfrest.com/pdfa"
STATUS_URL="https://api.pdfrest.com/request-status"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#PDFA_URL="https://eu-api.pdfrest.com/pdfa"
#STATUS_URL="https://eu-api.pdfrest.com/request-status"


API_KEY="xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

# Send a request with the response-type header.

REQUEST_ID=$(curl -X POST $PDFA_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: $API_KEY" \
  -H "response-type: requestId" \
  -F "file=@/path/to/file.pdf" \
  -F "output_type=PDF/A-3b" \
  -F "output=example_out" \
  | jq -r '.requestId')

# Get the request status at /request-status

RESPONSE=$(curl -X GET "$STATUS_URL/$REQUEST_ID" \
  -H "Api-Key: $API_KEY")
echo $RESPONSE
STATUS=$(echo $RESPONSE | jq -r '.status')

# This example repeats the GET request until the Toolkit request is completed.

while [ $STATUS = "pending" ]
do
  sleep 5
  RESPONSE=$(curl -X GET "$STATUS_URL/$REQUEST_ID" \
  -H "Api-Key: $API_KEY")
  echo $RESPONSE
  STATUS=$(echo $RESPONSE | jq -r '.status')
done
