# By default, we use the US-based API service. This is the primary endpoint for global use.
EXPORT_URL="https://api.pdfrest.com/exported-form-data"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#EXPORT_URL="https://eu-api.pdfrest.com/exported-form-data"

curl -X POST $EXPORT_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "data_format=xml" \
  -F "output=example_out"
