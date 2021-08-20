@isTest
public class BitlyShortenInvocableTest {

    @isTest
    static void test_shorten() {
        
        Test.startTest();
        
        Test.setMock( HttpCalloutMock.class, new BitlyServiceTest.BitlyHttpCalloutMock() );
        
        Id pwdRecordTypeId = Schema.SObjectType.Account.getRecordTypeInfosByName().get('PWD').getRecordTypeId();
        Account accountObj = new Account();
        accountObj.RecordTypeId = pwdRecordTypeId;
        accountObj.FirstName = 'Test';
        accountObj.LastName = 'Account';
        accountObj.PersonBirthDate = Date.today();
        accountObj.PersonMobilePhone = '4444441122';
        accountObj.Guardian_s_Phone__c = '1112224141';
        accountObj.Account_Number_Unique_ID__c = '5522114422';
        insert accountObj;
                
        accountObj = [ SELECT id, Short_Url__C, Welcome_Text_Link__c FROM Account WHERE id = :accountObj.id LIMIT 1 ];
        
        List<Id> accountIds = new List<Id>();
        accountIds.add(accountObj.Id);
        BitlyShortenURLInvocable.shorten(accountIds);
        
        Test.stopTest();
        
        accountObj = [ SELECT id, Short_Url__C FROM Account WHERE id = :accountObj.id LIMIT 1 ];
        
        System.assertEquals( String.isNotBlank( accountObj.Short_Url__C ), true, 'The Generated Short Url should not be empty');
        
    }
    
    @isTest
    static void test_shorten2() {
        
        Test.startTest();
        
        Test.setMock( HttpCalloutMock.class, new BitlyServiceTest.BitlyHttpCalloutMock() );
        
        BitlyShortenURLInvocable.shorten( new String[] {} );
        
        Test.stopTest();
        
    }
    
}