use UnitTest;
use Math;
use unit;
use temperature;

config const epsilon: real = 10e-6;

proc temperature_compile(test: borrowed Test) throws {
    var k = new kelvin(1);
    var c = new celsius(1);
    var f = new fahrenheit(1);
    test.assertTrue(true);
}

proc temperature_addition(test: borrowed Test) throws {
    var k1 = new kelvin(1);
    var k2 = new kelvin(2);
    test.assertEqual((k1 + k2).value(), 3.0);

    var c1 = new celsius(1);
    var c2 = new celsius(2);
    test.assertEqual((c1 + c2).value(), 3.0);

    var f1 = new fahrenheit(1);
    var f2 = new fahrenheit(2);
    test.assertLessThan(abs((f1 + f2).value() - 3.0), epsilon);

    test.assertLessThan(abs((k1 + c1).value() - 275.15), epsilon);
    test.assertLessThan(abs((k1 + f1).value() - 256.92778), epsilon);
}

proc temperature_operations(test: borrowed Test) throws {
    var k = new kelvin(1);
    var c = new celsius(1);
    test.assertNotEqual(c, k);

    var k2 = 3 * k;
    test.assertEqual(k2.value(), 3);
}

UnitTest.main();