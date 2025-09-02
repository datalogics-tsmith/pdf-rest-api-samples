
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
    using (var uploadRequest = new HttpRequestMessage(HttpMethod.Post, "upload"))
    {
        uploadRequest.Headers.TryAddWithoutValidation("Api-Key", "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
        uploadRequest.Headers.Accept.Add(new("application/json"));

        var uploadByteArray = File.ReadAllBytes("/path/to/file");
        var uploadByteAryContent = new ByteArrayContent(uploadByteArray);
        uploadByteAryContent.Headers.TryAddWithoutValidation("Content-Type", "application/octet-stream");
        uploadByteAryContent.Headers.TryAddWithoutValidation("Content-Filename", "filename.pdf");


        uploadRequest.Content = uploadByteAryContent;
        var uploadResponse = await httpClient.SendAsync(uploadRequest);

        var uploadResult = await uploadResponse.Content.ReadAsStringAsync();

        Console.WriteLine("Upload response received.");
        Console.WriteLine(uploadResult);

        JObject uploadResultJson = JObject.Parse(uploadResult);
        var uploadedID = uploadResultJson["files"][0]["id"];
        using (var SetBoxesRequest = new HttpRequestMessage(HttpMethod.Post, "pdf-with-page-boxes-set"))
        {
            SetBoxesRequest.Headers.TryAddWithoutValidation("Api-Key", "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
            SetBoxesRequest.Headers.Accept.Add(new("application/json"));

            SetBoxesRequest.Headers.TryAddWithoutValidation("Content-Type", "application/json");

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

            JObject parameterJson = new JObject
            {
                ["id"] = uploadedID,
                ["boxes"] = boxOptions.ToString(Formatting.None),
            };

            SetBoxesRequest.Content = new StringContent(parameterJson.ToString(), Encoding.UTF8, "application/json"); ;
            var SetBoxesResponse = await httpClient.SendAsync(SetBoxesRequest);

            var SetBoxesResult = await SetBoxesResponse.Content.ReadAsStringAsync();

            Console.WriteLine("Processing response received.");
            Console.WriteLine(SetBoxesResult);
        }
    }
}
