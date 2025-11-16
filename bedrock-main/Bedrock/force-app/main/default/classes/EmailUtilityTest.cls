/**
 * @description Test class for EmailUtility
 */
@IsTest
public class EmailUtilityTest {
    
    @IsTest
    static void testIsValidEmailAddress() {
        Boolean result = EmailUtility.isValidEmailAddress('test@example.com');
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsInvalidEmailAddress() {
        Boolean result = EmailUtility.isValidEmailAddress('invalid.email');
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testIsInvalidEmailMissingTld() {
        Boolean result = EmailUtility.isValidEmailAddress('test@example');
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testGetEmailDomain() {
        String result = EmailUtility.getEmailDomain('user@company.com');
        Assert.areEqual('company.com', result);
    }
    
    @IsTest
    static void testGetEmailDomainNoDomain() {
        String result = EmailUtility.getEmailDomain('nodomain');
        Assert.areEqual('', result);
    }
    
    @IsTest
    static void testExtractEmails() {
        String text = 'Contact us at support@example.com or sales@company.org';
        List<String> result = EmailUtility.extractEmails(text);
        Assert.areEqual(2, result.size());
    }
}
