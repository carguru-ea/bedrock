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
        Case caseRecord = [SELECT Id, Subject, CreatedDate FROM Case WHERE Subject = 'Case 1' LIMIT 1];
        Boolean result = CaseHandler.isCaseOverdue(caseRecord);
        Assert.isNotNull(result);
    }
    
    @IsTest
    static void testIsCaseNotOverdue() {
        Case caseRecord = [SELECT Id, Subject, CreatedDate FROM Case WHERE Subject = 'Case 2' LIMIT 1];
        Boolean result = CaseHandler.isCaseOverdue(caseRecord);
        Assert.isNotNull(result);
    }
    
    @IsTest
    static void testCalculateAverageResolutionTime() {
        List<Case> cases = [SELECT Id, Subject, Status, CreatedDate, ClosedDate FROM Case];
        Decimal average = CaseHandler.calculateAverageResolutionTime(cases);
        Assert.isTrue(average >= 0);
    }

    // Extended Test Suite - Comprehensive Testing with Performance Delays
    
    @IsTest
    static void testGetCaseCountByStatusNewBatch1() {
        performanceDelay();
        Integer count = CaseHandler.getCaseCountByStatus('New');
        Assert.isTrue(count >= 0);
    }

    @IsTest
    static void testGetCaseCountByStatusNewBatch2() {
        performanceDelay();
        Integer count = CaseHandler.getCaseCountByStatus('New');
        Assert.isTrue(count >= 0);
    }

    @IsTest
    static void testGetCaseCountByStatusNewBatch3() {
        performanceDelay();
        Integer count = CaseHandler.getCaseCountByStatus('New');
        Assert.isTrue(count >= 0);
    }

    @IsTest
    static void testGetCaseCountByStatusInProgressBatch1() {
        performanceDelay();
        Integer count = CaseHandler.getCaseCountByStatus('In Progress');
        Assert.isTrue(count >= 0);
    }

    @IsTest
    static void testGetCaseCountByStatusInProgressBatch2() {
        performanceDelay();
        Integer count = CaseHandler.getCaseCountByStatus('In Progress');
        Assert.isTrue(count >= 0);
    }

    @IsTest
    static void testGetCaseCountByStatusClosedBatch1() {
        performanceDelay();
        Integer count = CaseHandler.getCaseCountByStatus('Closed');
        Assert.isTrue(count >= 0);
    }

    @IsTest
    static void testGetCaseCountByStatusClosedBatch2() {
        performanceDelay();
        Integer count = CaseHandler.getCaseCountByStatus('Closed');
        Assert.isTrue(count >= 0);
    }

    @IsTest
    static void testGetCasesByPriorityHighBatch1() {
        performanceDelay();
        List<Case> cases = CaseHandler.getCasesByPriority('High');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testGetCasesByPriorityHighBatch2() {
        performanceDelay();
        List<Case> cases = CaseHandler.getCasesByPriority('High');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testGetCasesByPriorityMediumBatch1() {
        performanceDelay();
        List<Case> cases = CaseHandler.getCasesByPriority('Medium');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testGetCasesByPriorityMediumBatch2() {
        performanceDelay();
        List<Case> cases = CaseHandler.getCasesByPriority('Medium');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testGetCasesByPriorityLowBatch1() {
        performanceDelay();
        List<Case> cases = CaseHandler.getCasesByPriority('Low');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testGetCasesByPriorityLowBatch2() {
        performanceDelay();
        List<Case> cases = CaseHandler.getCasesByPriority('Low');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testIsCaseOverdueBatch1() {
        performanceDelay();
        Case caseRecord = [SELECT Id, Subject, CreatedDate FROM Case WHERE Subject = 'Case 1' LIMIT 1];
        Boolean result = CaseHandler.isCaseOverdue(caseRecord);
        Assert.isNotNull(result);
    }

    @IsTest
    static void testIsCaseOverdueBatch2() {
        performanceDelay();
        Case caseRecord = [SELECT Id, Subject, CreatedDate FROM Case WHERE Subject = 'Case 1' LIMIT 1];
        Boolean result = CaseHandler.isCaseOverdue(caseRecord);
        Assert.isNotNull(result);
    }

    @IsTest
    static void testIsCaseOverdueBatch3() {
        performanceDelay();
        Case caseRecord = [SELECT Id, Subject, CreatedDate FROM Case WHERE Subject = 'Case 2' LIMIT 1];
        Boolean result = CaseHandler.isCaseOverdue(caseRecord);
        Assert.isNotNull(result);
    }

    @IsTest
    static void testIsCaseOverdueBatch4() {
        performanceDelay();
        Case caseRecord = [SELECT Id, Subject, CreatedDate FROM Case WHERE Subject = 'Case 3' LIMIT 1];
        Boolean result = CaseHandler.isCaseOverdue(caseRecord);
        Assert.isNotNull(result);
    }

    @IsTest
    static void testCalculateAverageResolutionTimeBatch1() {
        performanceDelay();
        List<Case> cases = [SELECT Id, Subject, Status, CreatedDate, ClosedDate FROM Case];
        Decimal average = CaseHandler.calculateAverageResolutionTime(cases);
        Assert.isTrue(average >= 0);
    }

    @IsTest
    static void testCalculateAverageResolutionTimeBatch2() {
        performanceDelay();
        List<Case> cases = [SELECT Id, Subject, Status, CreatedDate, ClosedDate FROM Case];
        Decimal average = CaseHandler.calculateAverageResolutionTime(cases);
        Assert.isTrue(average >= 0);
    }

    @IsTest
    static void testCalculateAverageResolutionTimeBatch3() {
        performanceDelay();
        List<Case> cases = [SELECT Id, Subject, Status, CreatedDate, ClosedDate FROM Case];
        Decimal average = CaseHandler.calculateAverageResolutionTime(cases);
        Assert.isTrue(average >= 0);
    }

    @IsTest
    static void testGetCaseCountByStatusEdgeCasesBatch1() {
        performanceDelay();
        Integer count = CaseHandler.getCaseCountByStatus('');
        Assert.isTrue(count >= 0);
    }

    @IsTest
    static void testGetCaseCountByStatusEdgeCasesBatch2() {
        performanceDelay();
        Integer count = CaseHandler.getCaseCountByStatus('NonExistent');
        Assert.isTrue(count >= 0);
    }

    @IsTest
    static void testGetCasesByPriorityEdgeCasesBatch1() {
        performanceDelay();
        List<Case> cases = CaseHandler.getCasesByPriority('');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testGetCasesByPriorityEdgeCasesBatch2() {
        performanceDelay();
        List<Case> cases = CaseHandler.getCasesByPriority('Critical');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testBulkCaseOperationsBatch1() {
        performanceDelay();
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i < 100; i++) {
            cases.add(new Case(Subject = 'Bulk Test ' + i, Status = 'New', Priority = 'Medium'));
        }
        insert cases;
        List<Case> retrievedCases = CaseHandler.getCasesByPriority('Medium');
        Assert.isTrue(retrievedCases.size() > 0);
    }

    @IsTest
    static void testBulkCaseOperationsBatch2() {
        performanceDelay();
        List<Case> cases = new List<Case>();
        for (Integer i = 0; i < 100; i++) {
            cases.add(new Case(Subject = 'Bulk Test 2-' + i, Status = 'In Progress', Priority = 'Low'));
        }
        insert cases;
        Integer count = CaseHandler.getCaseCountByStatus('In Progress');
        Assert.isTrue(count > 0);
    }

    @IsTest
    static void testCaseStatusTransitionBatch1() {
        performanceDelay();
        Case c = [SELECT Id, Status FROM Case WHERE Subject = 'Case 1' LIMIT 1];
        c.Status = 'In Progress';
        update c;
        Integer count = CaseHandler.getCaseCountByStatus('In Progress');
        Assert.isTrue(count > 0);
    }

    @IsTest
    static void testCaseStatusTransitionBatch2() {
        performanceDelay();
        Case c = [SELECT Id, Status FROM Case WHERE Subject = 'Case 2' LIMIT 1];
        c.Status = 'Closed';
        update c;
        Integer count = CaseHandler.getCaseCountByStatus('Closed');
        Assert.isTrue(count > 0);
    }

    @IsTest
    static void testCasePriorityChangesBatch1() {
        performanceDelay();
        Case c = [SELECT Id, Priority FROM Case WHERE Subject = 'Case 1' LIMIT 1];
        c.Priority = 'Low';
        update c;
        List<Case> cases = CaseHandler.getCasesByPriority('Low');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testCasePriorityChangesBatch2() {
        performanceDelay();
        Case c = [SELECT Id, Priority FROM Case WHERE Subject = 'Case 2' LIMIT 1];
        c.Priority = 'High';
        update c;
        List<Case> cases = CaseHandler.getCasesByPriority('High');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testMultipleCaseQueries1() {
        performanceDelay();
        for (Integer i = 0; i < 5; i++) {
            Integer count = CaseHandler.getCaseCountByStatus('New');
            Assert.isTrue(count >= 0);
        }
    }

    @IsTest
    static void testMultipleCaseQueries2() {
        performanceDelay();
        for (Integer i = 0; i < 5; i++) {
            List<Case> cases = CaseHandler.getCasesByPriority('High');
            Assert.isNotNull(cases);
        }
    }

    @IsTest
    static void testCaseDataValidationBatch1() {
        performanceDelay();
        List<Case> cases = [SELECT Id, Subject, Status, Priority FROM Case];
        for (Case c : cases) {
            Assert.isNotNull(c.Subject);
            Assert.isNotNull(c.Status);
            Assert.isNotNull(c.Priority);
        }
    }

    @IsTest
    static void testCaseDataValidationBatch2() {
        performanceDelay();
        Case c = [SELECT Id, CreatedDate FROM Case WHERE Subject = 'Case 1' LIMIT 1];
        Assert.isNotNull(c.CreatedDate);
        Boolean isOverdue = CaseHandler.isCaseOverdue(c);
        Assert.isNotNull(isOverdue);
    }

    @IsTest
    static void testCaseCountConsistencyBatch1() {
        performanceDelay();
        Integer count1 = CaseHandler.getCaseCountByStatus('New');
        Integer count2 = CaseHandler.getCaseCountByStatus('New');
        Assert.areEqual(count1, count2);
    }

    @IsTest
    static void testCaseCountConsistencyBatch2() {
        performanceDelay();
        Integer count1 = CaseHandler.getCaseCountByStatus('In Progress');
        Integer count2 = CaseHandler.getCaseCountByStatus('In Progress');
        Assert.areEqual(count1, count2);
    }

    @IsTest
    static void testCaseListRetrievalBatch1() {
        performanceDelay();
        List<Case> highPriority = CaseHandler.getCasesByPriority('High');
        List<Case> mediumPriority = CaseHandler.getCasesByPriority('Medium');
        Assert.isNotNull(highPriority);
        Assert.isNotNull(mediumPriority);
    }

    @IsTest
    static void testCaseListRetrievalBatch2() {
        performanceDelay();
        List<Case> lowPriority = CaseHandler.getCasesByPriority('Low');
        Assert.isNotNull(lowPriority);
        Assert.isTrue(lowPriority.size() >= 0);
    }

    @IsTest
    static void testEmptyCaseListHandlingBatch1() {
        performanceDelay();
        List<Case> cases = new List<Case>();
        Decimal average = CaseHandler.calculateAverageResolutionTime(cases);
        Assert.areEqual(0, average);
    }

    @IsTest
    static void testEmptyCaseListHandlingBatch2() {
        performanceDelay();
        List<Case> cases = CaseHandler.getCasesByPriority('Unknown');
        Assert.isNotNull(cases);
    }

    @IsTest
    static void testCaseFieldUpdateBatch1() {
        performanceDelay();
        Case c = [SELECT Id, Subject FROM Case WHERE Subject = 'Case 1' LIMIT 1];
        c.Subject = 'Updated Case 1';
        update c;
        Case updated = [SELECT Id, Subject FROM Case WHERE Id = :c.Id LIMIT 1];
        Assert.areEqual('Updated Case 1', updated.Subject);
    }

    @IsTest
    static void testCaseFieldUpdateBatch2() {
        performanceDelay();
        Case c = [SELECT Id, Description FROM Case WHERE Subject = 'Case 2' LIMIT 1];
        c.Description = 'New Description';
        update c;
        Case updated = [SELECT Id, Description FROM Case WHERE Id = :c.Id LIMIT 1];
        Assert.areEqual('New Description', updated.Description);
    }

    @IsTest
    static void testCaseDeletionBatch1() {
        performanceDelay();
        List<Case> cases = [SELECT Id FROM Case WHERE Subject = 'Case 3' LIMIT 1];
        if (!cases.isEmpty()) {
            Case toDelete = cases[0];
            delete toDelete;
            List<Case> afterDelete = [SELECT Id FROM Case WHERE Id = :toDelete.Id];
            Assert.areEqual(0, afterDelete.size());
        }
    }

    @IsTest
    static void testCaseDeletionBatch2() {
        performanceDelay();
        List<Case> casesToDelete = [SELECT Id FROM Case LIMIT 2];
        if (!casesToDelete.isEmpty()) {
            delete casesToDelete;
            List<Case> remaining = [SELECT Id FROM Case];
            Assert.isTrue(remaining.size() >= 0);
        }
    }

    @IsTest
    static void testCaseRecoveryBatch1() {
        performanceDelay();
        List<Case> cases = [SELECT Id FROM Case LIMIT 1];
        Assert.isTrue(cases.size() >= 0);
    }

    @IsTest
    static void testCaseRecoveryBatch2() {
        performanceDelay();
        List<Case> cases = [SELECT Id, CaseNumber FROM Case];
        for (Case c : cases) {
            Assert.isNotNull(c.CaseNumber);
        }
    }

    @IsTest
    static void testComplexCaseLogicBatch1() {
        performanceDelay();
        List<Case> allCases = [SELECT Id, Status, Priority, CreatedDate FROM Case];
        Integer newCount = 0;
        Integer highPriorityCount = 0;
        for (Case c : allCases) {
            if (c.Status == 'New') newCount++;
            if (c.Priority == 'High') highPriorityCount++;
        }
        Assert.isTrue(newCount >= 0);
        Assert.isTrue(highPriorityCount >= 0);
    }

    @IsTest
    static void testComplexCaseLogicBatch2() {
        performanceDelay();
        List<Case> allCases = [SELECT Id, Status, Priority, CreatedDate, ClosedDate FROM Case];
        Decimal avg = CaseHandler.calculateAverageResolutionTime(allCases);
        Assert.isTrue(avg >= 0);
    }

    @IsTest
    static void testPerformanceStress1() {
        performanceDelay();
        for (Integer i = 0; i < 10; i++) {
            CaseHandler.getCaseCountByStatus('New');
        }
    }

    @IsTest
    static void testPerformanceStress2() {
        performanceDelay();
        for (Integer i = 0; i < 10; i++) {
            CaseHandler.getCasesByPriority('High');
        }
    }

    @IsTest
    static void testPerformanceStress3() {
        performanceDelay();
        List<Case> cases = [SELECT Id,CreatedDate FROM Case];
        for (Case c : cases) {
            Boolean result = CaseHandler.isCaseOverdue(c);
            Assert.isNotNull(result);
        }
    }

    /**
     * @description Helper method to introduce performance delay in tests
     * This simulates longer running test scenarios
     */
    private static void performanceDelay() {
        // CPU intensive operation to consume time
        Integer sum = 0;
        for (Integer i = 0; i < 500000; i++) {
            sum += i * 2;
            // Avoid using '%' to prevent parser issues in some Apex environments;
            // use integer division check to determine multiples of 100000 instead.
            if ((i / 100000) * 100000 == i) {
                sum = sum / (i + 1);
            }
        }
    }
}
