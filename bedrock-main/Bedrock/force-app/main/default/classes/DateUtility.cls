/**
 * @description Date utility for date operations
 */
public class DateUtility {
    
    public static Integer daysBetween(Date startDate, Date endDate) {
        return startDate.daysBetween(endDate);
    }
    
    public static Date addDays(Date baseDate, Integer days) {
        return baseDate.addDays(days);
    }
    
    public static Boolean isWeekend(Date checkDate) {
        Integer dayOfWeek = Math.mod(Date.newInstance(1900, 1, 7).daysBetween(checkDate), 7);
        return dayOfWeek == 5 || dayOfWeek == 6;
    }
    
    public static Date getMonthEnd(Date anyDateInMonth) {
        Date nextMonth = anyDateInMonth.addMonths(1);
        return nextMonth.toStartOfMonth().addDays(-1);
    }
}
