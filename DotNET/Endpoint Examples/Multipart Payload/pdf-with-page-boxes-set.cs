using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System.Text;

// By default, we use the US-based API service. This is the primary endpoint for global use.
var pdfrestURL="https://api.pdfrest.com";

// For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
// For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
//var pdfrestURL="https://eu-api.pdfrest.com";

using (var httpClient = new HttpClient { BaseAddress = new Uri(pdfrestURL) })
{
    using (var request = new HttpRequestMessage(HttpMethod.Post, "pdf-with-page-boxes-set"))
    {
        request.Headers.TryAddWithoutValidation("Api-Key", "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
        request.Headers.Accept.Add(new("application/json"));
        var multipartContent = new MultipartFormDataContent();

        var byteArray = File.ReadAllBytes("/path/to/file");
        var byteAryContent = new ByteArrayContent(byteArray);
        multipartContent.Add(byteAryContent, "file", "file_name.pdf");
        byteAryContent.Headers.TryAddWithoutValidation("Content-Type", "application/pdf");

        var boxOptions = new JObject
        {
            ["boxes"] = new JArray
            {
                new JObject
                {
                    ["box"] = "media",
                    ["pages"] = new JArray
                    {
                        new JObject
                        {
                            ["range"] = "1",
                            ["left"] = 100,
                            ["top"] = 100,
                            ["bottom"] = 100,
                            ["right"] = 100
                        }
                    }
                }
            }
        };


        var byteArrayOption = new ByteArrayContent(Encoding.UTF8.GetBytes(boxOptions.ToString(Formatting.None)));
        multipartContent.Add(byteArrayOption, "boxes");


        request.Content = multipartContent;
        var response = await httpClient.SendAsync(request);

        var apiResult = await response.Content.ReadAsStringAsync();

        Console.WriteLine("API response received.");
        Console.WriteLine(apiResult);
    }
}
