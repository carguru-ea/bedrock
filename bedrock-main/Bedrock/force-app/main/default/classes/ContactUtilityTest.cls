/**
 * @description Test class for ContactUtility
 */
@IsTest
public class ContactUtilityTest {
    
    @TestSetup
    static void setup() {
        Account acc = new Account(Name = 'Contact Test Account');
        insert acc;
        
        Contact con = new Contact(FirstName = 'John', LastName = 'Doe', Email = 'john@example.com', AccountId = acc.Id);
        insert con;
    }
    
    @IsTest
    static void testGetContactById() {
        Contact con = [SELECT Id FROM Contact LIMIT 1];
        Contact result = ContactUtility.getContactById(con.Id);
        Assert.isNotNull(result);
        Assert.areEqual('John', result.FirstName);
    }
    
    @IsTest
    static void testGetContactsByAccountId() {
        Account acc = [SELECT Id FROM Account LIMIT 1];
        List<Contact> results = ContactUtility.getContactsByAccountId(acc.Id);
        Assert.isTrue(results.size() > 0);
    }
    
    @IsTest
    static void testGetContactsByEmail() {
        List<Contact> results = ContactUtility.getContactsByEmail('john@example.com');
        Assert.isTrue(results.size() > 0);
    }
    
    @IsTest
    static void testGetContactCountByAccount() {
        Account acc = [SELECT Id FROM Account LIMIT 1];
        Integer count = ContactUtility.getContactCountByAccount(acc.Id);
        Assert.areEqual(1, count);
    }
}
