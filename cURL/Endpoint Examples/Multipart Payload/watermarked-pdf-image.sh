# By default, we use the US-based API service. This is the primary endpoint for global use.
WATERMARKED_URL="https://api.pdfrest.com/watermarked-pdf"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URLs below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#WATERMARKED_URL="https://eu-api.pdfrest.com/watermarked-pdf"

curl -X POST $WATERMARKED_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "watermark_file=@/path/to/file" \
  -F "output=example_out"
