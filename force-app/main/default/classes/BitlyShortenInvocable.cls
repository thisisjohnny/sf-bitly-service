public class BitlyShortenInvocable {
    
    @InvocableMethod(label = 'Bitly Shortener Service' description = 'Given a set of urls generates a bitly short url for each' callout = true)
    public static List<String> shorten( List<String> longUrls ) {
        return shortenService(longUrls);
    }
    
    // @Future( callout = true )
    private static List<String> shortenService( List<String> urls ) {
      
		BitlyService service = new BitlyService();
        List<String> shortenedUrls = new List<String>();

        for ( String url : urls ) {
            String shortUrl;
            shortUrl = service.shorten(url);
            shortenedUrls.add(shortUrl);
        }

        return shortenedUrls;
    }

}