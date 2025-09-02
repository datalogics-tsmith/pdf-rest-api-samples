# By default, we use the US-based API service. This is the primary endpoint for global use.
MERGE_URL="https://api.pdfrest.com/merged-pdf"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#MERGE_URL="https://eu-api.pdfrest.com/merged-pdf"


curl -X POST $MERGE_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "pages[]=all" -F "type[]=file" \
  -F "file=@/path/to/file" \
  -F "pages[]=all" -F "type[]=file" \
  -F "output=example_out"
