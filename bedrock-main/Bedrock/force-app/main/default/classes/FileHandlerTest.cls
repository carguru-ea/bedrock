/**
 * @description Test class for FileHandler
 */
@IsTest
public class FileHandlerTest {
    
    @IsTest
    static void testFileExists() {
        Boolean result = FileHandler.fileExists('NonExistentFile.txt');
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testGetFileExtension() {
        String result = FileHandler.getFileExtension('document.pdf');
        Assert.areEqual('pdf', result);
    }
    
    @IsTest
    static void testGetFileExtensionNoExtension() {
        String result = FileHandler.getFileExtension('filename');
        Assert.areEqual('', result);
    }
    
    @IsTest
    static void testIsValidFileType() {
        Set<String> allowed = new Set<String>{'pdf', 'doc', 'docx'};
        Boolean result = FileHandler.isValidFileType('document.pdf', allowed);
        Assert.isTrue(result);
    }
    
    @IsTest
    static void testIsInvalidFileType() {
        Set<String> allowed = new Set<String>{'pdf', 'doc'};
        Boolean result = FileHandler.isValidFileType('image.jpg', allowed);
        Assert.isFalse(result);
    }
    
    @IsTest
    static void testFormatFileSize() {
        String result = FileHandler.formatFileSize(1024);
        Assert.isTrue(result.contains('KB'));
    }
}
