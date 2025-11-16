/**
 * @description Test class for StringUtility
 */
@IsTest
public class StringUtilityTest {
    
    @IsTest
    static void testCapitalizeWords() {
        String result = StringUtility.capitalizeWords('hello world apex');
        Assert.areEqual('Hello World Apex', result);
    }
    
    @IsTest
    static void testCapitalizeWordsEmpty() {
        String result = StringUtility.capitalizeWords('');
        Assert.areEqual('', result);
    }
    
    @IsTest
    static void testCapitalizeWordsNull() {
        String result = StringUtility.capitalizeWords(null);
        Assert.areEqual('', result);
    }
    
    @IsTest
    static void testIsValidEmail() {
        Boolean result = StringUtility.isValidEmail('test@example.com');
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsInvalidEmail() {
        Boolean result = StringUtility.isValidEmail('invalid-email');
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testRemoveSpecialCharacters() {
        String result = StringUtility.removeSpecialCharacters('hello@world#123');
        Assert.areEqual('helloworld123', result);
    }
    
    @IsTest
    static void testSplitAndTrim() {
        List<String> results = StringUtility.splitAndTrim('  one , two , three  ', ',');
        Assert.areEqual(3, results.size());
        Assert.areEqual('one', results[0]);
    }
}
