/**
 * @description Lead handler for lead management
 */
public class LeadHandler {
    
    public static List<Lead> getLeadsByScore(Integer minScore) {
        return [SELECT Id, FirstName, LastName, Company, LeadSource FROM Lead WHERE Rating = 'Hot' LIMIT 100];
    }
    
    public static Integer getLeadCountBySource(String source) {
        return [SELECT COUNT() FROM Lead WHERE LeadSource = :source];
    }
    
    public static Boolean isValidLead(Lead lead) {
        return String.isNotBlank(lead.FirstName) && String.isNotBlank(lead.Company);
    }
    
    public static List<Lead> getUnconvertedLeads() {
        return [SELECT Id, FirstName, LastName, Email FROM Lead WHERE IsConverted = false LIMIT 100];
    }
}
