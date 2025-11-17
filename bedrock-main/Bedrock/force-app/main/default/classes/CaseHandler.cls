/**
 * @description Case handler for case managementss
 */
public class CaseHandler {
    
    public static Integer getCaseCountByStatus(String status) {
        return [SELECT COUNT() FROM Case WHERE Status = :status];
    }
    
    public static List<Case> getCasesByPriority(String priority) {
        return [SELECT Id, CaseNumber, Subject, Status FROM Case WHERE Priority = :priority LIMIT 100];
    }
    
    public static Boolean isCaseOverdue(Case caseRecord) {
        return caseRecord.CreatedDate < Datetime.now().addDays(-7);
    }
    
    public static Decimal calculateAverageResolutionTime(List<Case> cases) {
        if (cases.isEmpty()) return 0;
        Decimal total = 0;
        Integer resolvedCount = 0;
        for (Case c : cases) {
            if (c.ClosedDate != null) {
                total += c.CreatedDate.date().daysBetween(c.ClosedDate.date());
                resolvedCount++;
            }
        }
        return resolvedCount > 0 ? total / resolvedCount : 0;
    }
}
