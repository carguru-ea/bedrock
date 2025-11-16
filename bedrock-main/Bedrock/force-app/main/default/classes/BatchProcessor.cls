/**
 * @description Batch processor utility
 */
public class BatchProcessor {
    
    public static List<List<Object>> batchList(List<Object> items, Integer batchSize) {
        List<List<Object>> batches = new List<List<Object>>();
        for (Integer i = 0; i < items.size(); i += batchSize) {
            Integer endIndex = Math.min(i + batchSize, items.size());
            batches.add(new List<Object>(items.subList(i, endIndex)));
        }
        return batches;
    }
    
    public static Integer getTotalBatches(Integer totalItems, Integer batchSize) {
        return (Integer) Math.ceil((Decimal) totalItems / batchSize);
    }
    
    public static Boolean isLastBatch(Integer currentBatch, Integer totalBatches) {
        return currentBatch == totalBatches;
    }
}
