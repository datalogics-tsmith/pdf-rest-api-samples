#!/bin/sh

# By default, we use the US-based API service. This is the primary endpoint for global use.
UPLOAD_URL="https://api.pdfrest.com/upload"
REDACT_URL="https://api.pdfrest.com/pdf-with-redacted-text-preview"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URLs below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#UPLOAD_URL="https://eu-api.pdfrest.com/upload"
#REDACT_URL="https://eu-api.pdfrest.com/pdf-with-redacted-text-preview"

UPLOAD_ID=$(curl --location $UPLOAD_URL \
--header 'Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' \
--header 'content-filename: filename.pdf' \
--data-binary '@/path/to/file' \
 | jq -r '.files.[0].id')

echo "File successfully uploaded with an ID of: $UPLOAD_ID"

REDACTIONS='[{\"type\":\"preset\",\"value\":\"email\"},{\"type\":\"regex\",\"value\":\"(\\\\+\\\\d{1,2}\\\\s)?\\\\(?\\\\d{3}\\\\)?[\\\\s.-]\\\\d{3}[\\\\s.-]\\\\d{4}\"},{\"type\":\"literal\",\"value\":\"word\"}]'

curl $REDACT_URL \
--header 'Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' \
--header 'Content-Type: application/json' \
--data-raw "{ \"id\": \"$UPLOAD_ID\", \"redactions\": \"$REDACTIONS\"}" | jq -r '.'
