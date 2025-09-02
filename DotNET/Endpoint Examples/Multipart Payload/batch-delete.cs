// By default, we use the US-based API service. This is the primary endpoint for global use.
var pdfrestURL="https://api.pdfrest.com/delete";

// For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
// For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
//var pdfrestURL="https://eu-api.pdfrest.com/delete";

var client = new HttpClient();
var request = new HttpRequestMessage(HttpMethod.Post, pdfrestURL);
request.Headers.Add("api-key", "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
var content = new MultipartFormDataContent();
content.Add(new StringContent("xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx,xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"), "ids");
request.Content = content;
var response = await client.SendAsync(request);
response.EnsureSuccessStatusCode();
Console.WriteLine(await response.Content.ReadAsStringAsync());
