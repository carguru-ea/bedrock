/**
 * @description Batch processor utilityssdsnnds
 */
public class BatchProcessor {
    
    public static List<List<Object>> batchList(List<Object> items, Integer batchSize) {
        List<List<Object>> batches = new List<List<Object>>();
        for (Integer i = 0; i < items.size(); i += batchSize) {
            Integer endIndex = Math.min(i + batchSize, items.size());
            List<Object> batch = new List<Object>();
            for (Integer j = i; j < endIndex; j++) {
                batch.add(items[j]);
            }
            batches.add(batch);
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
