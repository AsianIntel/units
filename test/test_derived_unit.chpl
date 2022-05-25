use UnitTest;
use unit;
use marker;
use unit_registry;
use unit_time;
use temperature;
use Math;

config const epsilon: real = 10e-6;

proc derived_unit_compile(test: borrowed Test) throws {
    var velocity = new unit(1, 0, -1, 0, 0, 0, 0, 1, 0, 1, "m/s");

    var arr1 = [1, 2, 3, 4, 5];
    var velocity_arr = new unit_array(new UnitMarker(1, 0, -1, 0, 0, 0, 0, 1, 0, "m/s"), arr1);

    test.assertTrue(true);
}

proc derived_unit_addition(test: borrowed Test) throws {
    var v1 = new unit(1, 0, -1, 0, 0, 0, 0, 1, 0, 1, "m/s");
    var v2 = new unit(1, 0, -1, 0, 0, 0, 0, 1, 0, 2, "m/s");
    test.assertEqual((v1 + v2).value(), 3);

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [1, 1, 1, 1, 1];

    var v1_arr = new unit_array(new UnitMarker(1, 0, -1, 0, 0, 0, 0, 1, 0, "m/s"), arr1);
    var v2_arr = new unit_array(new UnitMarker(1, 0, -1, 0, 0, 0, 0, 1, 0, "m/s"), arr2);
    test.assertEqual((v1_arr + v2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);    
}

proc derived_unit_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var v1 = new unit(1, 0, -1, 0, 0, 0, 0, 1, 0, 1, "m/s");
    var v2 = new unit(1, 0, -1, 0, 0, 0, 0, 1, 0, 1000, "m/s");
    test.assertNotEqual(v1, v2);

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [1, 1, 1, 1, 1];
    var v1_arr = new unit_array(new UnitMarker(1, 0, -1, 0, 0, 0, 0, 1, 0, "m/s"), arr1);
    var v2_arr = new unit_array(new UnitMarker(1, 0, -1, 0, 0, 0, 0, 1, 0, "m/s"), arr2);
    var res = v1_arr != v2_arr;
    var testArr = [false, true, true, true, true];
    for (i, j) in zip(res, testArr) do
        test.assertEqual(i, j);    

    var v3 = 3 * v1;
    test.assertEqual(v3.value(), 3);

    var v3_arr = 3 * v1_arr;
    test.assertEqual(v3_arr.getArray(), [3.0, 6.0, 9.0, 12.0, 15.0]);

    var s2 = time(unitsystem.getTimeType("minute"), 1);
    var k = temperature(unitsystem.getTemperatureType("kelvin"), 1);
    var c = temperature(unitsystem.getTemperatureType("celsius"), 1);
    var s3 = time(unitsystem.getTimeType("second"), 1);
    
    var res2 = c * s2;    
    test.assertLessThan(res2.value() - 16449.0, epsilon);

    var s1_arr = time(unitsystem.getTimeType("minute"), arr2);
    var c1_arr = temperature(unitsystem.getTemperatureType("celsius"), arr2);

    var res2_arr = c1_arr * s1_arr;
    for i in res2_arr.getArray() do
        test.assertLessThan(i - 16449.0, epsilon);
}

UnitTest.main();