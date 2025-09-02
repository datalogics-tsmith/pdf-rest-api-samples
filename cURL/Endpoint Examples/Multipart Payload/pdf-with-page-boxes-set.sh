# By default, we use the US-based API service. This is the primary endpoint for global use.
BOXES_URL="https://api.pdfrest.com/pdf-with-page-boxes-set"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#BOXES_URL="https://eu-api.pdfrest.com/pdf-with-page-boxes-set"

BOXES='{"boxes":[{"box":"media","pages":[{"range":"1","left":100,"top":100,"bottom":100,"right":100}]}]}'

curl -X POST $BOXES_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "boxes=$BOXES" \
  -F "output=example_out.pdf"
