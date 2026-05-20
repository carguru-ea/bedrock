/**
 * @description Utility class for string operations
 */
public class StringUtility {
    
    public static String capitalizeWords(String text) {
        if (String.isBlank(text)) return '';
        String[] words = text.split(' ');
        List<String> capitalized = new List<String>();
        for (String word : words) {
            capitalized.add(word.capitalize());
        }
        return String.join(capitalized, ' ');
    }
    
    public static Boolean isValidEmail(String email) {
        String emailRegex = '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$';
        return Pattern.matches(emailRegex, email);
    }
    
    public static String removeSpecialCharacters(String text) {
        return text.replaceAll('[^a-zA-Z0-9\\s]', '');
    }
    
    public static List<String> splitAndTrim(String text, String delimiter) {
        List<String> parts = text.split(delimiter);
        List<String> trimmed = new List<String>();
        for (String part : parts) {
            trimmed.add(part.trim());
        }
        return trimmed;
    }
}
