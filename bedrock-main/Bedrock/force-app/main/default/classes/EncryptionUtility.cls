/**
 * @description Encryption utility for data protection
 */
public class EncryptionUtility {
    
    public static String encodeBase64(String input) {
        return EncodingUtil.base64Encode(Blob.valueOf(input));
    }
    
    public static String decodeBase64(String input) {
        return input != null ? EncodingUtil.base64Decode(input).toString() : '';
    }
    
    public static String generateHash(String input) {
        Blob hash = Crypto.generateDigest('SHA-256', Blob.valueOf(input));
        return EncodingUtil.base64Encode(hash);
    }
    
    public static String encodeUrl(String input) {
        return EncodingUtil.urlEncode(input, 'UTF-8');
    }
}
