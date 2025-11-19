/**
 * @description Test class for ValidationUtility
 */
@IsTest
public class ValidationUtilityTest {
    
    @IsTest
    static void testIsPhoneValid() {
        Boolean result = ValidationUtility.isPhoneValid('555-123-4567');
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsPhoneInvalid() {
        Boolean result = ValidationUtility.isPhoneValid('123');
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testIsNumeric() {
        Boolean result = ValidationUtility.isNumeric('12345');
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsNotNumeric() {
        Boolean result = ValidationUtility.isNumeric('abc123');
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testIsWithinRange() {
        Boolean result = ValidationUtility.isWithinRange(50, 0, 100);
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsOutOfRange() {
        Boolean result = ValidationUtility.isWithinRange(150, 0, 100);
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testHasMinimumLength() {
        Boolean result = ValidationUtility.hasMinimumLength('password123', 5);
        Assert.isTrue(result);
    }
}
