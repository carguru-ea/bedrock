/**
 * @description Test class for JsonUtility
 */
@IsTest
public class JsonUtilityTest {
    
    @IsTest
    static void testParseJson() {
        String json = '{"name":"John","age":30}';
        Map<String, Object> result = JsonUtility.parseJson(json);
        Assert.isNotNull(result);
        Assert.areEqual('John', result.get('name'));
    }
    
    @IsTest
    static void testParseJsonComplex() {
        String json = '{"items":[{"id":1},{"id":2}]}';
        Map<String, Object> result = JsonUtility.parseJson(json);
        Assert.isNotNull(result);
    }
    
    @IsTest
    static void testConvertToJson() {
        Map<String, String> data = new Map<String, String>{'key' => 'value'};
        String result = JsonUtility.convertToJson(data);
        Assert.isTrue(result.contains('key'));
        Assert.isTrue(result.contains('value'));
    }
    
    @IsTest
    static void testIsValidJson() {
        Boolean result = JsonUtility.isValidJson('{"valid":"json"}');
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsInvalidJson() {
        Boolean result = JsonUtility.isValidJson('{invalid json}');
        Assert.isFalse(result);
    }
}
