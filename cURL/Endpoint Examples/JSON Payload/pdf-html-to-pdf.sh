# By default, we use the US-based API service. This is the primary endpoint for global use.
PDF_URL="https://api.pdfrest.com/pdf"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URLs below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#PDF_URL="https://eu-api.pdfrest.com/pdf"

curl $PDF_URL \
--header 'Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx' \
--header 'Content-Type: application/json' \
--data-raw '{ "url": "https://pdfrest.com/"}' | jq -r '.'
