# By default, we use the US-based API service. This is the primary endpoint for global use.
LINEARIZE_URL="https://api.pdfrest.com/linearized-pdf"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#LINEARIZE_URL="https://eu-api.pdfrest.com/linearized-pdf"

curl -X POST $LINEARIZE_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "output=example_out"
