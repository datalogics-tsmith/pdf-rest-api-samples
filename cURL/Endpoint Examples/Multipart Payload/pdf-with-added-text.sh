
# By default, we use the US-based API service. This is the primary endpoint for global use.
ADD_TEXT_URL="https://api.pdfrest.com/pdf-with-added-text"

# For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
# For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
#ADD_TEXT_URL="https://eu-api.pdfrest.com/pdf-with-added-text"


TEXT_OPTIONS='[{"font":"Times New Roman","max_width":"175","opacity":"1","page":"1","rotation":"0","text":"sample text in PDF","text_color_rgb":"0,0,0","text_size":"30","x":"72","y":"144"}]'

curl -X POST $ADD_TEXT_URL \
  -H "Accept: application/json" \
  -H "Content-Type: multipart/form-data" \
  -H "Api-Key: xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" \
  -F "file=@/path/to/file" \
  -F "text_objects=$TEXT_OPTIONS" \
  -F "output=example_out"
