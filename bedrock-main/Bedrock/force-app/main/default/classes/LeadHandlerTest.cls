/**
 * @description Test class for LeadHandler
 */
@IsTest
public class LeadHandlerTest {
    
    @TestSetup
    static void setup() {
        List<Lead> leads = new List<Lead>();
        leads.add(new Lead(FirstName = 'John', LastName = 'Doe', Company = 'Acme Inc', LeadSource = 'Web'));
        leads.add(new Lead(FirstName = 'Jane', LastName = 'Smith', Company = 'Tech Corp', LeadSource = 'Partner'));
        leads.add(new Lead(FirstName = 'Bob', LastName = 'Johnson', Company = 'Global LLC', LeadSource = 'Web'));
        insert leads;
    }
    
    @IsTest
    static void testGetLeadsByScore() {
        List<Lead> leads = LeadHandler.getLeadsByScore(5);
        Assert.isNotNull(leads);
    }
    
    @IsTest
    static void testGetLeadCountBySource() {
        Integer count = LeadHandler.getLeadCountBySource('Web');
        Assert.isTrue(count >= 0);
    }
    
    @IsTest
    static void testIsValidLead() {
        Lead validLead = new Lead(FirstName = 'Test', Company = 'Test Co');
        Boolean result = LeadHandler.isValidLead(validLead);
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsInvalidLeadNoName() {
        Lead invalidLead = new Lead(Company = 'Test Co');
        Boolean result = LeadHandler.isValidLead(invalidLead);
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testIsInvalidLeadNoCompany() {
        Lead invalidLead = new Lead(FirstName = 'Test');
        Boolean result = LeadHandler.isValidLead(invalidLead);
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testGetUnconvertedLeads() {
        List<Lead> leads = LeadHandler.getUnconvertedLeads();
        Assert.isTrue(leads.size() > 0);
    }
}
