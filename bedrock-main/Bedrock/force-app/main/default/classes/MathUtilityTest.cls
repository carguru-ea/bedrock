/**
 * @description Test class for MathUtility
 */
@IsTest
public class MathUtilityTest {
    
    @IsTest
    static void testCalculateDiscount() {
        Decimal result = MathUtility.calculateDiscount(100, 10);
        Assert.areEqual(90, result);
    }
    
    @IsTest
    static void testCalculateDiscountLarge() {
        Decimal result = MathUtility.calculateDiscount(1000, 25);
        Assert.areEqual(750, result);
    }
    
    @IsTest
    static void testCalculateTax() {
        Decimal result = MathUtility.calculateTax(100, 8);
        Assert.areEqual(8, result);
    }
    
    @IsTest
    static void testCalculateAverage() {
        List<Decimal> numbers = new List<Decimal>{10, 20, 30};
        Decimal result = MathUtility.calculateAverage(numbers);
        Assert.areEqual(20, result);
    }
    
    @IsTest
    static void testCalculateAverageEmpty() {
        List<Decimal> numbers = new List<Decimal>();
        Decimal result = MathUtility.calculateAverage(numbers);
        Assert.areEqual(0, result);
    }
    
    @IsTest
    static void testRoundToNearestInteger() {
        Integer result = MathUtility.roundToNearestInteger(10.7);
        Assert.areEqual(11, result);
    }
}
