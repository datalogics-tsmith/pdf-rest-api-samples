# By default, we use the US-based API service. This is the primary endpoint for global use.
FORM_DATA_URL="https://api.pdfrest.com/pdf-with-imported-form-data"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#FORM_DATA_URL="https://eu-api.pdfrest.com/pdf-with-imported-form-data"

curl -X POST $FORM_DATA_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "output=example_out" \
  -F "data_file=@/path/to/datafile"