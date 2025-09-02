# By default, we use the US-based API service. This is the primary endpoint for global use.
ACROFORM_URL="https://api.pdfrest.com/pdf-with-acroforms"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#ACROFORM_URL="https://eu-api.pdfrest.com/pdf-with-acroforms"

curl -X POST $ACROFORM_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file"
