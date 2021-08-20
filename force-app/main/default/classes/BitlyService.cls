/**
 * Simple service to make http callout to
 * Bitly url shortener service.
 */
public class BitlyService {
      
    public String shorten( String url ) {
    	String bearerToken = 'your-bearer-token';
        HttpRequest req = new HttpRequest();
        req.setEndpoint('callout:Bitly/v4/shorten');
        req.setHeader('Accept', '*/*');
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Authorization', 'Bearer ' + bearerToken);
        req.setMethod('POST');

        ShortenBody body = new ShortenBody();
        body.long_url = url;
        body.domain = 'bit.ly';
        req.setBody(JSON.serialize(body));

        Http http = new Http();
        HttpResponse res = http.send(req);
        ShortenResponse response = (ShortenResponse)JSON.deserialize(res.getBody(), ShortenResponse.class);
        return response.link;
    }
    
    private class ShortenBody {
        public String long_url { get;set; }
        public string domain { get;set; }
    }
    
    private class ShortenResponse {
        public String link { get;set; }
    }   
}