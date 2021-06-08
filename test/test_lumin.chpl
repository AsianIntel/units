use UnitTest;
use unit;
use lumin;

proc lumin_compile(test: borrowed Test) throws {
    var cd = new candela(1);    
    test.assertTrue(true);
}

proc lumin_addition(test: borrowed Test) throws {
    var cd1 = new candela(1);
    var cd2 = new candela(2);
    test.assertEqual((cd1 + cd2).value, 3.0);    
}

UnitTest.main();