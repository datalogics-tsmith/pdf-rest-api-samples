# By default, we use the US-based API service. This is the primary endpoint for global use.
REDACTION_PREVIEW_URL="https://api.pdfrest.com/pdf-with-redacted-text-preview"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#REDACTION_PREVIEW_URL="https://eu-api.pdfrest.com/pdf-with-redacted-text-preview"

REDACTIONS='[{"type":"preset","value":"email"},{"type":"regex","value":"(\\+\\d{1,2}\\s)?\\(?\\d{3}\\)?[\\s.-]\\d{3}[\\s.-]\\d{4}"},{"type":"literal","value":"word"}]'

curl -X POST $REDACTION_PREVIEW_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "redactions=$REDACTIONS" \
  -F "output=example_out"
