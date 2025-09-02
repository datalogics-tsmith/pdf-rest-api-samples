# By default, we use the US-based API service. This is the primary endpoint for global use.
PDFA_URL="https://api.pdfrest.com/pdfa"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#PDFA_URL="https://eu-api.pdfrest.com/pdfa"

curl -X POST $PDFA_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "output=example_out" \
  -F "output_type=PDF/A-1b" \
  -F "rasterize_if_errors_encountered=off"
