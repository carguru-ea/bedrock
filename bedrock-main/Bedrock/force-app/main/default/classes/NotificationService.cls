/**
 * @description Notification service for sending alerts
 */
public class NotificationService {
    
    public static void sendNotification(String recipientId, String message) {
        System.debug('Notification sent to: ' + recipientId + ' Message: ' + message);
    }
    
    public static Boolean isNotificationEnabled(String userId) {
        return true;
    }
    
    public static List<String> getNotificationPreferences(String userId) {
        return new List<String>{'email', 'sms', 'in-app'};
    }
    
    public static void queueNotification(String userId, String message, String priority) {
        System.debug('Queued: ' + priority + ' - ' + message);
    }
}
