use UnitTest;
use unit;
use unit_registry;
use unit_time;
use temperature;
use Math;

config const epsilon: real = 10e-6;

proc derived_unit_compile(test: borrowed Test) throws {
    var velocity = new unit(1, 0, -1, 0, 0, 0, 0, 1, 0, 1, "m/s");
    test.assertTrue(true);
}

proc derived_unit_addition(test: borrowed Test) throws {
    var v1 = new unit(1, 0, -1, 0, 0, 0, 0, 1, 0, 1, "m/s");
    var v2 = new unit(1, 0, -1, 0, 0, 0, 0, 1, 0, 2, "m/s");
    test.assertEqual((v1 + v2).value(), 3);
}

proc derived_unit_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var v1 = new unit(1, 0, -1, 0, 0, 0, 0, 1, 0, 1, "m/s");
    var v2 = new unit(1, 0, -1, 0, 0, 0, 0, 1, 0, 1000, "m/s");
    test.assertNotEqual(v1, v2);

    var v3 = 3 * v1;
    test.assertEqual(v3.value(), 3);

    var s2 = time(unitsystem.getTimeType("minute"), 1);
    var k = temperature(unitsystem.getTemperatureType("kelvin"), 1);
    var c = temperature(unitsystem.getTemperatureType("celsius"), 1);
    var s3 = time(unitsystem.getTimeType("second"), 1);
    
    var res2 = c * s2;    
    test.assertLessThan(res2.value() - 16449.0, epsilon);
}

UnitTest.main();