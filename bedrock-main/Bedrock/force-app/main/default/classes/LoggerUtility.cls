/**
 * @description Logger utility for debugging and error handlingss
 */
public class LoggerUtility {
    
    private static List<String> logs = new List<String>();
    
    public static void addLog(String message) {
        logs.add(message);
    }
    
    public static void addLog(String category, String message) {
        logs.add('[' + category + '] ' + message);
    }
    
    public static List<String> getLogs() {
        return logs;
    }
    
    public static String getFormattedLogs() {
        return String.join(logs, '\n');
    }
    
    public static void clearLogs() {
        logs.clear();
    }
    
    public static Integer getLogCount() {
        return logs.size();
    }
}
