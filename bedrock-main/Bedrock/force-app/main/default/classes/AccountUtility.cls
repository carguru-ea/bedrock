/**
 * @description Utility class for nnddddJcfddssdds
 */
public class AccountUtility {
    
    /**
     * @description Get account by IDdd
     * @param accountId The account ID
     * @return Account record
     */
    public static Account getAccountById(Id accountId) {
        return [SELECT Id, Name, Industry, BillingCity FROM Account WHERE Id = :accountId LIMIT 1];
    }
    
    /**
     * @description Get all accounts with specified industry
     * @param industry The industry filterddd
     * @return List of accounts
     */
    public static List<Account> getAccountsByIndustry(String industry) {
        return [SELECT Id, Name, Industry, Phone FROM Account WHERE Industry = :industry];
    }
    
    /**
     * @description Check if account name exists
     * @param accountName The account name to check
     * @return True if account exists
     */
    public static Boolean accountNameExists(String accountName) {
        List<Account> accounts = [SELECT Id FROM Account WHERE Name = :accountName LIMIT 1];
        return accounts.size() > 0;
    }
}
