var client = new HttpClient();

// By default, we use the US-based API service. This is the primary endpoint for global use.
var pdfrestURL="https://api.pdfrest.com";

// For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
// For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
//var pdfrestURL="https://eu-api.pdfrest.com";

var request = new HttpRequestMessage(HttpMethod.Delete, $"{pdfrestURL}/resource/xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
request.Headers.Add("api-key", "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
var response = await client.SendAsync(request);
response.EnsureSuccessStatusCode();
Console.WriteLine(await response.Content.ReadAsStringAsync());
