public class BitlyShortenInvocable {
    
    @InvocableMethod(label = 'Bitly Shortener Service' description = 'Given a set of urls generates a bitly short url for each' callout = true)
    public static List<UrlShortenResults> shortenService( List<UrlShortenRequests> flowUrls ) {
        // parse inputs and variables
        List<String> urls = flowUrls.get(0).longUrls;
        List<String> shortenedUrls = new List<String>();

        // send urls through bit.ly service
        BitlyService service = new BitlyService();
        
        for ( String url : urls ) {
            String shortUrl;
            shortUrl = service.shorten(url);
            shortenedUrls.add(shortUrl);
        }

        // parse outputs
        UrlShortenResults results = new UrlShortenResults();
        results.shortenedUrls = shortenedUrls;
        List<UrlShortenResults> resultsList = new List<UrlShortenResults>();
        resultsList.add(results);

        return resultsList;
    }

    public class UrlShortenRequests{
        @InvocableVariable(label = 'Long URLs' required = true)
        public List<String> longUrls;
    }

    public class UrlShortenResults{
        @InvocableVariable(label = 'Shortened URLs')
        public List<String> shortenedUrls;
    }

}