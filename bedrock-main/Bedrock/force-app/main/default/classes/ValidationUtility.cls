/**
 * @description Data validation utility TESTING
 */
public class ValidationUtility {
    
    public static Boolean isPhoneValid(String phone) {
        String phoneRegex = '^[\\d\\s\\(\\)\\-\\+]{7,20}$';
        return Pattern.matches(phoneRegex, phone);
    }
    
    public static Boolean isNumeric(String value) {
        try {
            Decimal.valueOf(value);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public static Boolean isWithinRange(Decimal value, Decimal min, Decimal max) {
        return value >= min && value <= max;
    }
    
    public static Boolean hasMinimumLength(String value, Integer minLength) {
        return value != null && value.length() >= minLength;
    }
}
