# By default, we use the US-based API service. This is the primary endpoint for global use.
GET_URL="https://api.pdfrest.com/resource"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#GET_URL="https://eu-api.pdfrest.com/resource"


curl -X GET "{$GET_URL}/xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx?format=url"
