use UnitTest;
use unit;
use unit_registry;
use electric_current;

proc current_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var kA = electric_current(unitsystem.getECurrentType("kiloampere"), 1);
    var A = electric_current(unitsystem.getECurrentType("ampere"), 1);

    var arr1 = [1, 2, 3, 4, 5];
    var kA1_arr = electric_current(unitsystem.getECurrentType("kiloampere"), arr1);

    test.assertTrue(true);
}

proc current_addition(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var kA1 = electric_current(unitsystem.getECurrentType("kiloampere"), 1);
    var kA2 = electric_current(unitsystem.getECurrentType("kiloampere"), 2);
    test.assertEqual((kA1 + kA2).value(), 3);

    var A1 = electric_current(unitsystem.getECurrentType("ampere"), 1);
    var A2 = electric_current(unitsystem.getECurrentType("ampere"), 2);
    test.assertEqual((A1 + A2).value(), 3);

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [1, 1, 1, 1, 1];

    var kA1_arr = electric_current(unitsystem.getECurrentType("kiloampere"), arr1);
    var kA2_arr = electric_current(unitsystem.getECurrentType("kiloampere"), arr2);
    test.assertEqual((kA1_arr + kA2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    var A1_arr = electric_current(unitsystem.getECurrentType("ampere"), arr1);
    var A2_arr = electric_current(unitsystem.getECurrentType("ampere"), arr2);
    test.assertEqual((A1_arr + A2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    test.assertEqual((kA1 + A1).value(), 1.001);
    test.assertEqual((A1 + kA1).value(), 1001);
    test.assertEqual((kA1_arr + A1_arr).getArray(), [1.001, 2.002, 3.003, 4.004, 5.005]);
    test.assertEqual((A1_arr + kA1_arr).getArray(), [1001.0, 2002.0, 3003.0, 4004.0, 5005.0]);
}

proc current_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var kA = electric_current(unitsystem.getECurrentType("kiloampere"), 1);
    var A = electric_current(unitsystem.getECurrentType("ampere"), 1);
    test.assertNotEqual(kA, A);

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [0.001, 0.002, 0.003, 0.004, 0.005];

    var kA1_arr = electric_current(unitsystem.getECurrentType("kiloampere"), arr1);
    var A1_arr = electric_current(unitsystem.getECurrentType("ampere"), arr1);
    var res = kA1_arr != A1_arr;
    var testArr = [true, true, true, true, true];
    for(i, j) in zip(res, testArr) do 
        test.assertEqual(i, j);
    
    var kA2 = 3 * kA;
    test.assertEqual(kA2.value(), 3);

    var kA2_arr = 3 * kA1_arr;
    test.assertEqual(kA2_arr.getArray(), [3.0, 6.0, 9.0, 12.0, 15.0]);
}

UnitTest.main();