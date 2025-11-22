/**
 * @description Email utility for email operations
 */
public class EmailUtility {
    
    public static Boolean isValidEmailAddress(String email) {
        String emailRegex = '^[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}$';
        return Pattern.matches(emailRegex, email);
    }
    
    public static String getEmailDomain(String email) {
        if (email.contains('@')) {
            return email.substringAfter('@');
        }
        return '';
    }
    
    public static List<String> extractEmails(String text) {
        List<String> emails = new List<String>();
        String emailRegex = '[a-zA-Z0-9._%-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}';
        Pattern emailPattern = Pattern.compile(emailRegex);
        Matcher emailMatcher = emailPattern.matcher(text);
        while (emailMatcher.find()) {
            emails.add(emailMatcher.group());
        }
        return emails;
    }
}
