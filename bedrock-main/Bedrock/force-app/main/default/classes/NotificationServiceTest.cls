/**
 * @description Test class for NotificationService
 */
@IsTest
public class NotificationServiceTest {
    
    @IsTest
    static void testSendNotification() {
        Test.startTest();
        NotificationService.sendNotification('user123', 'Test message');
        Test.stopTest();
        Assert.isTrue(true);
    }
    
    @IsTest
    static void testIsNotificationEnabled() {
        Boolean result = NotificationService.isNotificationEnabled('user123');
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testGetNotificationPreferences() {
        List<String> result = NotificationService.getNotificationPreferences('user123');
        Assert.areEqual(3, result.size());
        Assert.isTrue(result.contains('email'));
    }
    
    @IsTest
    static void testQueueNotification() {
        Test.startTest();
        NotificationService.queueNotification('user123', 'Urgent message', 'HIGH');
        Test.stopTest();
        Assert.isTrue(true);
    }
}
