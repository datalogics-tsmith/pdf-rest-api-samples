
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
        using (var infoRequest = new HttpRequestMessage(HttpMethod.Post, "pdf-info"))
        {
            infoRequest.Headers.TryAddWithoutValidation("Api-Key", "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
            infoRequest.Headers.Accept.Add(new("application/json"));

            infoRequest.Headers.TryAddWithoutValidation("Content-Type", "application/json");


            JObject parameterJson = new JObject
            {
                ["id"] = uploadedID,
                ["queries"] = "title, page_count, doc_language, tagged, image_only, author, creation_date, modified_date, producer"
            };

            infoRequest.Content = new StringContent(parameterJson.ToString(), Encoding.UTF8, "application/json"); ;
            var infoResponse = await httpClient.SendAsync(infoRequest);

            var infoResult = await infoResponse.Content.ReadAsStringAsync();

            Console.WriteLine("Processing response received.");
            Console.WriteLine(infoResult);
        }
    }
}
