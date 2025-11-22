/**
 * @description Test class for ListUtility
 */
@IsTest
public class ListUtilityTest {
    
    @IsTest
    static void testRemoveDuplicates() {
        List<Object> items = new List<Object>{'a', 'b', 'a', 'c'};
        List<Object> result = ListUtility.removeDuplicates(items);
        Assert.areEqual(3, result.size());
    }
    
    @IsTest
    static void testFindIndex() {
        List<String> items = new List<String>{'one', 'two', 'three'};
        Integer result = ListUtility.findIndex(items, 'two');
        Assert.areEqual(1, result);
    }
    
    @IsTest
    static void testFindIndexNotFound() {
        List<String> items = new List<String>{'one', 'two', 'three'};
        Integer result = ListUtility.findIndex(items, 'four');
        Assert.areEqual(-1, result);
    }
    
    @IsTest
    static void testReverseList() {
        List<String> items = new List<String>{'a', 'b', 'c'};
        List<String> result = ListUtility.reverseList(items);
        Assert.areEqual('c', result[0]);
        Assert.areEqual('a', result[2]);
    }
    
    @IsTest
    static void testPaginateFirstPage() {
        List<String> items = new List<String>{'1', '2', '3', '4', '5'};
        List<String> result = ListUtility.paginate(items, 2, 1);
        Assert.areEqual(2, result.size());
    }
    
    @IsTest
    static void testPaginateSecondPage() {
        List<String> items = new List<String>{'1', '2', '3', '4', '5'};
        List<String> result = ListUtility.paginate(items, 2, 2);
        Assert.areEqual(2, result.size());
    }
}
