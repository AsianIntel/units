use UnitTest;
use unit;
use luminous_intensity;

proc luminous_intensity_compile(test: borrowed Test) throws {
    var cd = new candela(1);
    var kcd = new kilocandela(1);    
    test.assertTrue(true);
}

proc luminous_intensity_addition(test: borrowed Test) throws {
    var cd1 = new candela(1);
    var cd2 = new candela(2);
    test.assertEqual((cd1 + cd2).value(), 3.0);

    var kcd1 = new kilocandela(1);
    var kcd2 = new kilocandela(2);
    test.assertEqual((kcd1 + kcd2).value(), 3.0);

    test.assertEqual((kcd1 + cd1).value(), 1.001);
    test.assertEqual((cd1 + kcd1).value(), 1001);    
}

proc current_operations(test: borrowed Test) throws {
    var kcd = new kilocandela(1);
    var cd = new candela(1);
    test.assertNotEqual(kcd, cd);

    var kcd2 = 3 * kcd;
    test.assertEqual(kcd2.value(), 3);
}

UnitTest.main();