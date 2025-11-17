/**
 * @description Test class for DateUtilitysssn
 */
@IsTest
public class DateUtilityTest {
    
    @IsTest
    static void testDaysBetween() {
        Date start = Date.newInstance(2025, 1, 1);
        Date endDate = Date.newInstance(2025, 1, 11);
        Integer days = DateUtility.daysBetween(start, endDate);
        Assert.areEqual(10, days);
    }
    
    @IsTest
    static void testAddDays() {
        Date start = Date.newInstance(2025, 1, 1);
        Date result = DateUtility.addDays(start, 5);
        Assert.areEqual(Date.newInstance(2025, 1, 6), result);
    }
    
    @IsTest
    static void testAddDaysNegative() {
        Date start = Date.newInstance(2025, 1, 10);
        Date result = DateUtility.addDays(start, -5);
        Assert.areEqual(Date.newInstance(2025, 1, 5), result);
    }
    
    @IsTest
    static void testIsWeekend() {
        Date saturday = Date.newInstance(2025, 1, 4);
        Boolean result = DateUtility.isWeekend(saturday);
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsNotWeekend() {
        Date monday = Date.newInstance(2025, 1, 6);
        Boolean result = DateUtility.isWeekend(monday);
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testGetMonthEnd() {
        Date anyDate = Date.newInstance(2025, 1, 15);
        Date result = DateUtility.getMonthEnd(anyDate);
        Assert.areEqual(Date.newInstance(2025, 1, 31), result);
    }
}
