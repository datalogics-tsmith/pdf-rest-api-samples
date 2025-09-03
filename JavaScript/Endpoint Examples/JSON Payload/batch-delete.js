const axios = require("axios");

// US endpoint: https://api.pdfrest.com
// EU endpoint: https://api.eu.pdfrest.com
var api_url = "https://api.pdfrest.com";

let config = {
  method: "post",
  maxBodyLength: Infinity,
  url: api_url + "/delete",
  headers: {
    "api-key": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx", // Replace with your API key
    "Content-Type": "application/json",
  },
  data: {
    ids:
      "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx, xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  },
};

// send request and handle response or error
axios
  .request(config)
  .then((response) => {
    console.log(JSON.stringify(response.data));
  })
  .catch((error) => {
    console.log(error);
  });
