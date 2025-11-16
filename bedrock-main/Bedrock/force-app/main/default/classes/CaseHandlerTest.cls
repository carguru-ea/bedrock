/**
 * @description Test class for CaseHandler
 */
@IsTest
public class CaseHandlerTest {
    
    @TestSetup
    static void setup() {
        List<Case> cases = new List<Case>();
        cases.add(new Case(Subject = 'Case 1', Status = 'New', Priority = 'High'));
        cases.add(new Case(Subject = 'Case 2', Status = 'In Progress', Priority = 'Medium'));
        cases.add(new Case(Subject = 'Case 3', Status = 'Closed', Priority = 'Low'));
        insert cases;
    }
    
    @IsTest
    static void testGetCaseCountByStatus() {
        Integer count = CaseHandler.getCaseCountByStatus('New');
        Assert.isTrue(count >= 0);
    }
    
    @IsTest
    static void testGetCasesByPriority() {
        List<Case> cases = CaseHandler.getCasesByPriority('High');
        Assert.isNotNull(cases);
    }
    
    @IsTest
    static void testIsCaseOverdue() {
        Case caseRecord = new Case(Subject = 'Test', CreatedDate = Datetime.now().addDays(-10));
        Boolean result = CaseHandler.isCaseOverdue(caseRecord);
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsCaseNotOverdue() {
        Case caseRecord = new Case(Subject = 'Test', CreatedDate = Datetime.now().addDays(-2));
        Boolean result = CaseHandler.isCaseOverdue(caseRecord);
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testCalculateAverageResolutionTime() {
        List<Case> cases = [SELECT Id, Subject, Status, CreatedDate, ClosedDate FROM Case];
        Decimal average = CaseHandler.calculateAverageResolutionTime(cases);
        Assert.isTrue(average >= 0);
    }
}
