# By default, we use the US-based API service. This is the primary endpoint for global use.
ZIP_URL="https://api.pdfrest.com/zip"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URLs below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#ZIP_URL="https://eu-api.pdfrest.com/zip"

curl -X POST $ZIP_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "file=@/path/to/file" \
  -F "file=@/path/to/file" \
  -F "output=example_out"
