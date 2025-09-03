const axios = require("axios");

// By default, we use the US-based API service. This is the primary endpoint for global use.
let api_url = "https://api.pdfrest.com"

// For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
// For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
//let api_url = "https://eu-api.pdfrest.com"

let config = {
  method: "delete",
  maxBodyLength: Infinity,
  url: api_url + "/resource/xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  headers: {
    "api-key": "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  },
};

axios
  .request(config)
  .then((response) => {
    console.log(JSON.stringify(response.data));
  })
  .catch((error) => {
    console.log(error);
  });
