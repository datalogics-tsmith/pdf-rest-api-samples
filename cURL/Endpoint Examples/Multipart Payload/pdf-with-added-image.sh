

# By default, we use the US-based API service. This is the primary endpoint for global use.
ADD_IMAGE_URL="https://api.pdfrest.com/pdf-with-added-image"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#ADD_IMAGE_URL="https://eu-api.pdfrest.com/pdf-with-added-image"

curl -X POST $ADD_IMAGE_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "image_file=@/path/to/file" \
  -F "output=example_out" \
  -F "x=10" \
  -F "y=10" \
  -F "page=1"
