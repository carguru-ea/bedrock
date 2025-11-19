/**
 * @description Opportunity handler for business logic
 */
public class OpportunityHandler {
    
    public static Decimal calculateTotalPipeline(List<Opportunity> opportunities) {
        Decimal total = 0;
        for (Opportunity opp : opportunities) {
            if (opp.StageName != 'Closed Lost') {
                total += opp.Amount != null ? opp.Amount : 0;
            }
        }
        return total;
    }
    
    public static Integer countClosedWonOpportunities(List<Opportunity> opportunities) {
        Integer count = 0;
        for (Opportunity opp : opportunities) {
            if (opp.StageName == 'Closed Won') {
                count++;
            }
        }
        return count;
    }
    
    public static List<Opportunity> filterByMinAmount(List<Opportunity> opportunities, Decimal minAmount) {
        List<Opportunity> filtered = new List<Opportunity>();
        for (Opportunity opp : opportunities) {
            if (opp.Amount != null && opp.Amount >= minAmount) {
                filtered.add(opp);
            }
        }
        return filtered;
    }
}
