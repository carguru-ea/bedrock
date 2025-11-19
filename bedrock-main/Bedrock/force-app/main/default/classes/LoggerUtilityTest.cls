/**
 * @description Test class for LoggerUtility
 */
@IsTest
public class LoggerUtilityTest {
    
    @IsTest
    static void testAddLog() {
        LoggerUtility.addLog('Test message');
        Assert.areEqual(1, LoggerUtility.getLogCount());
    }
    
    @IsTest
    static void testAddLogWithCategory() {
        LoggerUtility.addLog('ERROR', 'Something went wrong');
        List<String> logs = LoggerUtility.getLogs();
        Assert.areEqual(1, logs.size());
        Assert.areEqual('[ERROR] Something went wrong', logs[0]);
    }
    
    @IsTest
    static void testGetLogs() {
        LoggerUtility.addLog('Log 1');
        LoggerUtility.addLog('Log 2');
        List<String> logs = LoggerUtility.getLogs();
        Assert.areEqual(2, logs.size());
    }
    
    @IsTest
    static void testGetFormattedLogs() {
        LoggerUtility.addLog('Line 1');
        LoggerUtility.addLog('Line 2');
        String formatted = LoggerUtility.getFormattedLogs();
        Assert.isTrue(formatted.contains('Line 1'));
        Assert.isTrue(formatted.contains('Line 2'));
    }
    
    @IsTest
    static void testClearLogs() {
        LoggerUtility.addLog('Test');
        LoggerUtility.clearLogs();
        Assert.areEqual(0, LoggerUtility.getLogCount());
    }
    
    @IsTest
    static void testGetLogCount() {
        LoggerUtility.addLog('1');
        LoggerUtility.addLog('2');
        LoggerUtility.addLog('3');
        Assert.areEqual(3, LoggerUtility.getLogCount());
    }
}
