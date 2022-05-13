use UnitTest;
use Math;
use unit;
use unit_registry;
use temperature;

config const epsilon: real = 10e-6;

proc temperature_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var k = temperature(unitsystem.getTemperatureType("kelvin"), 1);
    var c = temperature(unitsystem.getTemperatureType("celsius"), 1);
    var f = temperature(unitsystem.getTemperatureType("fahrenheit"), 1);
    test.assertTrue(true);
}

proc temperature_addition(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var k1 = temperature(unitsystem.getTemperatureType("kelvin"), 1);
    var k2 = temperature(unitsystem.getTemperatureType("kelvin"), 2);
    test.assertEqual((k1 + k2).value(), 3.0);

    var c1 = temperature(unitsystem.getTemperatureType("celsius"), 1);
    var c2 = temperature(unitsystem.getTemperatureType("celsius"), 2);
    test.assertEqual((c1 + c2).value(), 3.0);

    var f1 = temperature(unitsystem.getTemperatureType("fahrenheit"), 1);
    var f2 = temperature(unitsystem.getTemperatureType("fahrenheit"), 2);
    test.assertLessThan(abs((f1 + f2).value() - 3.0), epsilon);

    test.assertLessThan(abs((k1 + c1).value() - 275.15), epsilon);
    test.assertLessThan(abs((k1 + f1).value() - 256.92778), epsilon);
}

proc temperature_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var k = temperature(unitsystem.getTemperatureType("kelvin"), 1);
    var c = temperature(unitsystem.getTemperatureType("celsius"), 1);
    test.assertNotEqual(c, k);

    var k2 = 3 * k;
    test.assertEqual(k2.value(), 3);
}

UnitTest.main();