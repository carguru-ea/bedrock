/**
 * @description List utility for list operations
 */
public class ListUtility {
    
    public static List<Object> removeDuplicates(List<Object> items) {
        Set<Object> uniqueItems = new Set<Object>(items);
        return new List<Object>(uniqueItems);
    }
    
    public static Integer findIndex(List<String> items, String target) {
        for (Integer i = 0; i < items.size(); i++) {
            if (items[i] == target) {
                return i;
            }
        }
        return -1;
    }
    
    public static List<String> reverseList(List<String> items) {
        List<String> reversed = new List<String>();
        for (Integer i = items.size() - 1; i >= 0; i--) {
            reversed.add(items[i]);
        }
        return reversed;
    }
    
    public static List<String> paginate(List<String> items, Integer pageSize, Integer pageNumber) {
        Integer startIndex = (pageNumber - 1) * pageSize;
        Integer endIndex = Math.min(startIndex + pageSize, items.size());
        return items.subList(startIndex, endIndex);
    }
}
