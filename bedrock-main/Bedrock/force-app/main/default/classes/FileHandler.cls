/**
 * @description File handler for file operations
 */
public class FileHandler {
    
    public static Boolean fileExists(String fileName) {
        try {
            List<ContentDocument> docs = [SELECT Id FROM ContentDocument WHERE Title = :fileName LIMIT 1];
            return docs.size() > 0;
        } catch (Exception e) {
            return false;
        }
    }
    
    public static String getFileExtension(String fileName) {
        if (fileName.contains('.')) {
            return fileName.substringAfterLast('.');
        }
        return '';
    }
    
    public static Boolean isValidFileType(String fileName, Set<String> allowedTypes) {
        String extension = getFileExtension(fileName);
        return allowedTypes.contains(extension.toLowerCase());
    }
    
    public static String formatFileSize(Long bytes) {
        List<String> sizes = new List<String>{'B', 'KB', 'MB', 'GB'};
        if (bytes == 0) return '0 B';
        Integer i = 0;
        Decimal size = bytes;
        while (size >= 1024 && i < sizes.size() - 1) {
            size = size / 1024;
            i++;
        }
        return String.valueOf(size.setScale(2)) + ' ' + sizes[i];
    }
}
