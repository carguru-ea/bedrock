/**
 * @description Test class for EncryptionUtility
 */
@IsTest
public class EncryptionUtilityTest {
    
    @IsTest
    static void testEncodeBase64() {
        String result = EncryptionUtility.encodeBase64('Hello World');
        Assert.isNotNull(result);
        Assert.isTrue(result.length() > 0);
    }
    
    @IsTest
    static void testDecodeBase64() {
        String encoded = EncryptionUtility.encodeBase64('Hello World');
        String result = EncryptionUtility.decodeBase64(encoded);
        Assert.areEqual('Hello World', result);
    }
    
    @IsTest
    static void testGenerateHash() {
        String result = EncryptionUtility.generateHash('password');
        Assert.isNotNull(result);
        Assert.isTrue(result.length() > 0);
    }
    
    @IsTest
    static void testGenerateHashConsistent() {
        String hash1 = EncryptionUtility.generateHash('test');
        String hash2 = EncryptionUtility.generateHash('test');
        Assert.areEqual(hash1, hash2);
    }
    
    @IsTest
    static void testEncodeUrl() {
        String result = EncryptionUtility.encodeUrl('hello world');
        Assert.areEqual('hello%20world', result);
    }
}
