@isTest
private class Check2Test {
    @isTest static void testAdd_PositiveNumbers() {
        Test.startTest();
//sdsdsdn
        Integer result = Check2.add(2, 3);
        Test.stopTest();
        System.assertEquals(5, result, '2 + 3 should equal 5');
    }

    @isTest static void testAdd_WithNulls() {
        Test.startTest();
        Integer result1 = Check2.add(null, 4);
        Integer result2 = Check2.add(7, null);
        Integer result3 = Check2.add(null, null);
        Test.stopTest();
        System.assertEquals(4, result1, 'null treated as 0 should yield 4');
        System.assertEquals(7, result2, 'null treated as 0 should yield 7');
        System.assertEquals(0, result3, 'both nulls treated as 0 should yield 0');
//kkkk
    }
}
