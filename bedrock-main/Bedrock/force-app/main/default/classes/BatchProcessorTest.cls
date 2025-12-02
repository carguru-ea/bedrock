/**
 * @description Test class for BatchProcessorsd
 */
@IsTest
public class BatchProcessorTest {
    
    @IsTest
    static void testBatchList() {
        List<Object> items = new List<Object>{'1', '2', '3', '4', '5'};
        List<List<Object>> result = BatchProcessor.batchList(items, 2);
        Assert.areEqual(3, result.size());
    }
    
    @IsTest
    static void testBatchListSingleBatch() {
        List<Object> items = new List<Object>{'1', '2'};
        List<List<Object>> result = BatchProcessor.batchList(items, 5);
        Assert.areEqual(1, result.size());
    }
    
    @IsTest
    static void testGetTotalBatches() {
        Integer result = BatchProcessor.getTotalBatches(10, 3);
        Assert.areEqual(4, result);
    }
    
    @IsTest
    static void testGetTotalBatchesEven() {
        Integer result = BatchProcessor.getTotalBatches(10, 5);
        Assert.areEqual(2, result);
    }
    
    @IsTest
    static void testIsLastBatch() {
        Boolean result = BatchProcessor.isLastBatch(5, 5);
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsNotLastBatch() {
        Boolean result = BatchProcessor.isLastBatch(3, 5);
        Assert.isFalse(result);
    }
}
