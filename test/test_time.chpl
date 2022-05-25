use UnitTest;
use unit;
use unit_registry;
use unit_time;
use Math;

config const epsilon: real = 10e-6;

proc time_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var s = time(unitsystem.getTimeType("second"), 1);
    var m = time(unitsystem.getTimeType("minute"), 1);

    var arr1 = [1, 2, 3, 4, 5];
    var s1_arr = time(unitsystem.getTimeType("second"), arr1);

    test.assertTrue(true);
}

proc time_addition(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var s1 = time(unitsystem.getTimeType("second"), 1);
    var s2 = time(unitsystem.getTimeType("second"), 2);
    test.assertEqual((s1 + s2).value(), 3.0);

    var m1 = time(unitsystem.getTimeType("minute"), 1);
    var m2 = time(unitsystem.getTimeType("minute"), 2);
    test.assertEqual((m1 + m2).value(), 3.0);

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [1, 1, 1, 1, 1];

    var s1_arr = time(unitsystem.getTimeType("second"), arr1);
    var s2_arr = time(unitsystem.getTimeType("second"), arr2);
    test.assertEqual((s1_arr + s2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    var m1_arr = time(unitsystem.getTimeType("minute"), arr1);
    var m2_arr = time(unitsystem.getTimeType("minute"), arr2);
    test.assertEqual((m1_arr + m2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    test.assertLessThan(abs((s1 + m1).value() - 61.0), epsilon);
    test.assertLessThan(abs((m1 + s1).value() - 1.01667), epsilon);

    var temp1 = [61.0, 122.0, 183.0, 244.0, 305.0];
    var res1_arr = s1_arr + m1_arr;
    for(i, j) in zip(res1_arr.getArray(), temp1) do
        test.assertLessThan(abs(i - j), epsilon);
    
    var temp2 = [1.01667, 2.03333, 3.05, 4.06667, 5.08333];
    var res2_arr = m1_arr + s1_arr;
    for(i, j) in zip(res2_arr.getArray(), temp2) do
        test.assertLessThan(abs(i - j), epsilon);

}

proc time_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var s = time(unitsystem.getTimeType("second"), 1);
    var m = time(unitsystem.getTimeType("minute"), 1);
    test.assertNotEqual(s, m);

    var arr1 = [1, 2, 3, 4, 5];    
    
    var s1_arr = time(unitsystem.getTimeType("second"), arr1);   
    
    var m2 = 3 * m;
    test.assertEqual(m2.value(), 3);

    var s2_arr = 3 * s1_arr;
    test.assertEqual(s2_arr.getArray(), [3.0, 6.0, 9.0, 12.0, 15.0]);
}

UnitTest.main();