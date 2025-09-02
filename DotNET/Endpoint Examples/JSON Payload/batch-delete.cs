using Newtonsoft.Json.Linq;
using System.Text;

var client = new HttpClient();

// By default, we use the US-based API service. This is the primary endpoint for global use.
var deleteURL="https://api.pdfrest.com/delete"

// For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
// For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
//var deleteURL="https://eu-api.pdfrest.com/delete"


var request = new HttpRequestMessage(HttpMethod.Post, deleteURL);
request.Headers.Add("api-key", "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
request.Headers.TryAddWithoutValidation("Content-Type", "application/json");


JObject parameterJson = new JObject
{
    ["ids"] = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx, xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
};

request.Content = new StringContent(parameterJson.ToString(), Encoding.UTF8, "application/json"); ;
var response = await client.SendAsync(request);
response.EnsureSuccessStatusCode();
Console.WriteLine(await response.Content.ReadAsStringAsync());
