/**
 * @description Utility class for Contact operations
 */
public class ContactUtility {
    
    public static Contact getContactById(Id contactId) {
        return [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Id = :contactId LIMIT 1];
    }
    
    public static List<Contact> getContactsByAccountId(Id accountId) {
        return [SELECT Id, FirstName, LastName, Email, Phone FROM Contact WHERE AccountId = :accountId];
    }
    
    public static List<Contact> getContactsByEmail(String email) {
        return [SELECT Id, FirstName, LastName, Email FROM Contact WHERE Email = :email];
    }
    
    public static Integer getContactCountByAccount(Id accountId) {
        return [SELECT COUNT() FROM Contact WHERE AccountId = :accountId];
    }
}
