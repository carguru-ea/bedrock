/**
 * @description Math utility for calculationss
 */
public class MathUtility {
    
    public static Decimal calculateDiscount(Decimal originalPrice, Decimal discountPercent) {
        return originalPrice * (1 - (discountPercent / 100));
    }
    
    public static Decimal calculateTax(Decimal amount, Decimal taxRate) {
        return amount * (taxRate / 100);
    }
    
    public static Decimal calculateAverage(List<Decimal> numbers) {
        if (numbers.isEmpty()) return 0;
        Decimal sum = 0;
        for (Decimal num : numbers) {
            sum += num;
        }
        return sum / numbers.size();
    }
    
    public static Integer roundToNearestInteger(Decimal value) {
        return Integer.valueOf(Math.round(value));
    }
}
