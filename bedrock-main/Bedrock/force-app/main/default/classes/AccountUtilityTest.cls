/**
 * @description Test class for AccountUtility
 */
@IsTest
public class AccountUtilityTest {
    
    @TestSetup
    static void setup() {
        Account acc = new Account(Name = 'Test Account', Industry = 'Technology');
        insert acc;
    }
    
    @IsTest
    static void testGetAccountById() {
        Account acc = [SELECT Id FROM Account LIMIT 1];
        Account result = AccountUtility.getAccountById(acc.Id);
        Assert.isNotNull(result);
        Assert.areEqual('Test Account', result.Name);
    }
    
    @IsTest
    static void testGetAccountsByIndustry() {
        List<Account> results = AccountUtility.getAccountsByIndustry('Technology');
        Assert.isTrue(results.size() > 0);
    }
    
    @IsTest
    static void testGetAccountsByIndustryEmpty() {
        List<Account> results = AccountUtility.getAccountsByIndustry('NonExistent');
        Assert.areEqual(0, results.size());
    }
    
    @IsTest
    static void testAccountNameExists() {
        Boolean exists = AccountUtility.accountNameExists('Test Account');
        Assert.isTrue(exists);
    }
    
    @IsTest
    static void testAccountNameNotExists() {
        Boolean exists = AccountUtility.accountNameExists('NonExistentAccount');
        Assert.isFalse(exists);
    }
}
