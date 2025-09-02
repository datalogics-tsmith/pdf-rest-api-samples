#!/bin/sh

# By default, we use the US-based API service. This is the primary endpoint for global use.
UPLOAD_URL="https://api.pdfrest.com/upload"
ADDED_IMAGE_URL="https://api.pdfrest.com/pdf-with-added-image"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URLs below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#UPLOAD_URL="https://eu-api.pdfrest.com/upload"
#ADDED_IMAGE_URL="https://eu-api.pdfrest.com/pdf-with-added-image"

UPLOAD_PDF_FILE_ID=$(curl --location $UPLOAD_URL \
--header 'Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' \
--header 'content-filename: filename.pdf' \
--data-binary '@/path/to/pdf_file' \
 | jq -r '.files.[0].id')

echo "PDF file successfully uploaded with an ID of: $UPLOAD_PDF_FILE_ID"

UPLOAD_IMAGE_FILE_ID=$(curl --location $UPLOAD_URL \
--header 'Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' \
--header 'content-filename: filename.png' \
--data-binary '@/path/to/image_file' \
| jq -r '.files.[0].id')

echo "Image file successfully uploaded with an ID of: $UPLOAD_IMAGE_FILE_ID"

curl $ADDED_IMAGE_URL \
--header 'Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' \
--header 'Content-Type: application/json' \
--data-raw "{ \"id\": \"$UPLOAD_PDF_FILE_ID\", \"image_id\": \"$UPLOAD_IMAGE_FILE_ID\", \"page\":1, \"x\":0, \"y\":0 }" | jq -r '.'
