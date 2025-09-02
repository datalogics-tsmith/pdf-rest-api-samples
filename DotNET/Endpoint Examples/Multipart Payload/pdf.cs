using System.Text;

// By default, we use the US-based API service. This is the primary endpoint for global use.
var pdfrestURL="https://api.pdfrest.com";

// For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
// For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
//var pdfrestURL="https://eu-api.pdfrest.com";

using (var httpClient = new HttpClient { BaseAddress = new Uri(pdfrestURL) })
{
    using (var request = new HttpRequestMessage(HttpMethod.Post, "pdf"))
    {
        request.Headers.TryAddWithoutValidation("Api-Key", "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx");
        request.Headers.Accept.Add(new("application/json"));
        var multipartContent = new MultipartFormDataContent();

        var byteArray = File.ReadAllBytes("/path/to/file");
        var byteAryContent = new ByteArrayContent(byteArray);
        multipartContent.Add(byteAryContent, "file", "file_name");
        byteAryContent.Headers.TryAddWithoutValidation("Content-Type", "text/html");

        var byteArrayOption = new ByteArrayContent(Encoding.UTF8.GetBytes("A4"));
        multipartContent.Add(byteArrayOption, "page_size");

        var byteArrayOption2 = new ByteArrayContent(Encoding.UTF8.GetBytes("output.pdf"));
        multipartContent.Add(byteArrayOption2, "output");
        request.Content = multipartContent;
        var response = await httpClient.SendAsync(request);

        var apiResult = await response.Content.ReadAsStringAsync();

        Console.WriteLine("API response received.");
        Console.WriteLine(apiResult);
    }
}
