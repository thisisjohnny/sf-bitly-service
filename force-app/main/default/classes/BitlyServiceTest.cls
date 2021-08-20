@isTest
public class BitlyServiceTest {

    public class BitlyHttpCalloutMock implements HttpCalloutMock {
    
        public HttpResponse respond( HttpRequest req ) {
    
           	HttpResponse res = new HttpResponse();
            res.setBody('{"created_at":"2021-01-05T18:04:13+0000","id":"bitly.is/38hh9ji","link":"https://bitly.is/38hh9ji","custom_bitlinks":[],"long_url":"https://dev.bitly.com/","archived":false,"tags":[],"deeplinks":[],"references":{"group":"https://api-ssl.bitly.com/v4/groups/Bl14mNmCxSl"}}');
            res.setStatusCode(200);
            return res;
           
        }       
    }
    
    @isTest
    static void test_shorten() {

        Test.startTest();

        Test.setMock( HttpCalloutMock.class, new BitlyHttpCalloutMock() );

        BitlyService service = new BitlyService();

        String shortURL = service.shorten( URL.getSalesforceBaseUrl().toExternalForm() ) ;

        Test.stopTest();

    }

}