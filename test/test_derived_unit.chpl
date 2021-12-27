use UnitTest;
use unit;
use derived_unit;
use unit_time;
use temperature;
use Math;

config const epsilon: real = 10e-6;

proc derived_unit_compile(test: borrowed Test) throws {
    var velocity = new derived_unit(1, 0, -1, 0, 0, 0, 0, 1, 1, 0);
    test.assertTrue(true);
}

proc derived_unit_addition(test: borrowed Test) throws {
    var v1 = new derived_unit(1, 0, -1, 0, 0, 0, 0, 1, 1, 0);
    var v2 = new derived_unit(1, 0, -1, 0, 0, 0, 0, 2, 1, 0);
    test.assertEqual((v1 + v2).value(), 3);
}

proc derived_unit_operations(test: borrowed Test) throws {
    var v1 = new derived_unit(1, 0, -1, 0, 0, 0, 0, 1, 1, 0);
    var v2 = new derived_unit(1, 0, -1, 0, 0, 0, 0, 1, 1000, 0);
    test.assertNotEqual(v1, v2);

    var v3 = 3 * v1;
    test.assertEqual(v3.value(), 3);

    var s2 = new minute(1);
    var c = new celsius(1);
    var k = new kelvin(1);
    var s3 = new second(1);
    var res = k / s3 + c / s2;
    test.assertLessThan(abs(res.to_base() - 5.56917), epsilon);

    var res2 = c * s2;
    test.assertEqual(res2.to_base(), 1);
}

UnitTest.main();