#!/bin/sh
# By default, we use the US-based API service. This is the primary endpoint for global use.
DELETE_URL="https://api.pdfrest.com/delete"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#DELETE_URL="https://eu-api.pdfrest.com/delete"

curl --request POST $DELETE_URL \
--header 'Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' \
--header 'Content-Type: application/json' \
--data-raw "{ \"ids\": \"xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx, xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx\"}" | jq -r '.'
