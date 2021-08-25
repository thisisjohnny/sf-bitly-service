public class BitlyService {
      
    public String shorten( String url ) {
        BitlyMetadata bitly = new BitlyMetadata();
    	String bearerToken = bitly.token;
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api-ssl.bitly.com/v4/shorten');
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

    private class BitlyMetadata {
        Bitly_API_Token__mdt cmdt = [SELECT API_Token__c FROM Bitly_API_Token__mdt WHERE Is_Active__c = true LIMIT 1];

        public String token = cmdt.API_Token__c;
    }
}