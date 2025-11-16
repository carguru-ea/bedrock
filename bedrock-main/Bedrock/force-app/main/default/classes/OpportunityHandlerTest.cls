/**
 * @description Test class for OpportunityHandler
 */
@IsTest
public class OpportunityHandlerTest {
    
    @TestSetup
    static void setup() {
        Account acc = new Account(Name = 'Opp Test Account');
        insert acc;
        
        List<Opportunity> opps = new List<Opportunity>();
        opps.add(new Opportunity(Name = 'Opp 1', StageName = 'Prospecting', Amount = 50000, CloseDate = Date.today(), AccountId = acc.Id));
        opps.add(new Opportunity(Name = 'Opp 2', StageName = 'Closed Won', Amount = 100000, CloseDate = Date.today(), AccountId = acc.Id));
        opps.add(new Opportunity(Name = 'Opp 3', StageName = 'Closed Lost', Amount = 30000, CloseDate = Date.today(), AccountId = acc.Id));
        insert opps;
    }
    
    @IsTest
    static void testCalculateTotalPipeline() {
        List<Opportunity> opps = [SELECT Id, Name, StageName, Amount FROM Opportunity];
        Decimal total = OpportunityHandler.calculateTotalPipeline(opps);
        Assert.areEqual(150000, total);
    }
    
    @IsTest
    static void testCountClosedWonOpportunities() {
        List<Opportunity> opps = [SELECT Id, Name, StageName, Amount FROM Opportunity];
        Integer count = OpportunityHandler.countClosedWonOpportunities(opps);
        Assert.areEqual(1, count);
    }
    
    @IsTest
    static void testFilterByMinAmount() {
        List<Opportunity> opps = [SELECT Id, Name, StageName, Amount FROM Opportunity];
        List<Opportunity> filtered = OpportunityHandler.filterByMinAmount(opps, 50000);
        Assert.areEqual(3, filtered.size());
    }
    
    @IsTest
    static void testFilterByMinAmountHighThreshold() {
        List<Opportunity> opps = [SELECT Id, Name, StageName, Amount FROM Opportunity];
        List<Opportunity> filtered = OpportunityHandler.filterByMinAmount(opps, 80000);
        Assert.areEqual(1, filtered.size());
    }
}
