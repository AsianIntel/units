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

    var arr1 = [1, 2, 3, 4, 5];
    var k1_arr = temperature(unitsystem.getTemperatureType("kelvin"), arr1);
    var c1_arr = temperature(unitsystem.getTemperatureType("celsius"), arr1);
    var f1_arr = temperature(unitsystem.getTemperatureType("fahrenheit"), arr1);
    
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

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [1, 1, 1, 1, 1];

    var k1_arr = temperature(unitsystem.getTemperatureType("kelvin"), arr1);
    var k2_arr = temperature(unitsystem.getTemperatureType("kelvin"), arr2);
    test.assertEqual((k1_arr + k2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    var c1_arr = temperature(unitsystem.getTemperatureType("celsius"), arr1);
    var c2_arr = temperature(unitsystem.getTemperatureType("celsius"), arr2);
    test.assertEqual((c1_arr + c2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    var f1_arr = temperature(unitsystem.getTemperatureType("fahrenheit"), arr1);
    var f2_arr = temperature(unitsystem.getTemperatureType("fahrenheit"), arr2);
    test.assertEqual((f1_arr + f2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);
    
    test.assertLessThan(abs((k1 + c1).value() - 275.15), epsilon);
    test.assertLessThan(abs((k1 + f1).value() - 256.92778), epsilon);
}

proc temperature_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var k = temperature(unitsystem.getTemperatureType("kelvin"), 1);
    var c = temperature(unitsystem.getTemperatureType("celsius"), 1);
    test.assertNotEqual(c, k);

    var arr1 = [1, 2, 3, 4, 5];

    var k1_arr = temperature(unitsystem.getTemperatureType("kelvin"), arr1);
    
    var k2 = 3 * k;
    test.assertEqual(k2.value(), 3);

    var k2_arr = 3 * k1_arr;
    test.assertEqual(k2_arr.getArray(), [3.0, 6.0, 9.0, 12.0, 15.0]);
}

UnitTest.main();