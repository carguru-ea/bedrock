public without sharing class Check2 {
    //TEST 1mmmmnnnnndddsdsddddsssss

    // Basic method: returns sum ofddd two integers (treats null as 0)
    public static Integer add(Integer a, Integer b) {
        Integer x = (a == null) ? 0 : a;
        Integer y = (b == null) ? 0 : b;
        return x + y;
    }
}
