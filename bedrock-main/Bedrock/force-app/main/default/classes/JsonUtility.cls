/**
 * @description JSON utility for JSON operations
 */
public class JsonUtility {
    
    public static Map<String, Object> parseJson(String jsonString) {
        return (Map<String, Object>) JSON.deserializeUntyped(jsonString);
    }
    
    public static String convertToJson(Object obj) {
        return JSON.serialize(obj);
    }
    
    public static Boolean isValidJson(String jsonString) {
        try {
            JSON.deserializeUntyped(jsonString);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
