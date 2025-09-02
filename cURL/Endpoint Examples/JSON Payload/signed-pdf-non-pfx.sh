#!/bin/sh

# By default, we use the US-based API service. This is the primary endpoint for global use.
UPLOAD_URL="https://api.pdfrest.com/upload"
SIGN_URL="https://api.pdfrest.com/signed-pdf"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URLs below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#UPLOAD_URL="https://eu-api.pdfrest.com/upload"
#SIGN_URL="https://eu-api.pdfrest.com/signed-pdf"

API_KEY=xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx

PDF_ID=$(curl --location $UPLOAD_URL \
--header "Api-Key: $API_KEY" \
--header 'content-filename: input.pdf' \
--data-binary '@/path/to/input.pdf' \
 | jq -r '.files.[0].id')

echo "PDF successfully uploaded with an ID of: $PDF_ID"

CERT_ID=$(curl --location $UPLOAD_URL \
--header "Api-Key: $API_KEY" \
--header 'content-filename: certificate.pem' \
--data-binary '@/path/to/certificate.pem' \
 | jq -r '.files.[0].id')

echo "Certificate file successfully uploaded with an ID of: $CREDS_ID"

KEY_ID=$(curl --location $UPLOAD_URL \
--header "Api-Key: $API_KEY" \
--header 'content-filename: private_key.pem' \
--data-binary '@/path/to/private_key.pem' \
 | jq -r '.files.[0].id')

echo "Key file successfully uploaded with an ID of: $PASSPHRASE_ID"

SIGNATURE_CONFIG='{\"type\": \"new\",\"name\": \"esignature\",\"location\": {\"bottom_left\": { \"x\": \"0\", \"y\": \"0\" },\"top_right\": { \"x\": \"216\", \"y\": \"72\" },\"page\": 1},\"display\": {\"include_datetime\": \"true\"}}'

curl $SIGN_URL \
--header "Api-Key: $API_KEY" \
--header 'Content-Type: application/json' \
--data-raw "{ \"id\": \"$PDF_ID\", \"certificate_id\": \"$CERT_ID\", \"private_key_id\": \"$KEY_ID\", \"signature_configuration\": \"$SIGNATURE_CONFIG\"}" | jq -r '.'
