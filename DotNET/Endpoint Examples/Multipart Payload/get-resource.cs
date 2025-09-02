// By default, we use the US-based API service. This is the primary endpoint for global use.
var pdfrestURL="https://api.pdfrest.com/resource/";

// For GDPR compliance and enhanced performance for European users, you can switch to the EU-based service by uncommenting the URL below.
// For more information visit https://pdfrest.com/pricing#how-do-eu-gdpr-api-calls-work
//var pdfrestURL="https://eu-api.pdfrest.com/resource/";

using (var httpClient = new HttpClient { BaseAddress = new Uri(pdfrestURL) } )
{
    try
    {
        string id = "xxxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx";  // ID to retrieve

        using (var stream = await httpClient.GetStreamAsync(id + "?format=file"))
        {
            using (var fs = new FileStream("/path/to/save/file", FileMode.CreateNew))
            {
                await stream.CopyToAsync(fs);
            }
        }
    }
    catch (HttpRequestException e)
    {
        Console.WriteLine("Message :{0} ", e.Message);
    }
}
