#up-forms and up-office can be used to query the other tools
# By default, we use the US-based API service. This is the primary endpoint for global use.
UP_URL="https://api.pdfrest.com/up-toolkit"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URLs below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#UP_URL="https://eu-api.pdfrest.com/up-toolkit"

curl -X GET $UP_URL
