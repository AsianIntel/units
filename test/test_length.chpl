use UnitTest;
use unit;
use unit_registry;
use length;

proc length_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var m = length(unitsystem.getLengthType("meter"), 1);
    var cm = length(unitsystem.getLengthType("centimeter"), 1);

    var arr1 = [1, 2, 3, 4, 5];
    var m1_arr = length(unitsystem.getLengthType("meter"), arr1);

    test.assertTrue(true);
}

proc length_addition(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS"); 

    var m1 = length(unitsystem.getLengthType("meter"), 1);
    var m2 = length(unitsystem.getLengthType("meter"), 2);
    test.assertEqual((m1 + m2).value(), 3.0);

    var cm1 = length(unitsystem.getLengthType("centimeter"), 1);
    var cm2 = length(unitsystem.getLengthType("centimeter"), 2);
    test.assertEqual((cm1 + cm2).value(), 3.0);

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [1, 1, 1, 1, 1];

    var m1_arr = length(unitsystem.getLengthType("meter"), arr1);
    var m2_arr = length(unitsystem.getLengthType("meter"), arr2);
    test.assertEqual((m1_arr + m2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    var cm1_arr = length(unitsystem.getLengthType("centimeter"), arr1);
    var cm2_arr = length(unitsystem.getLengthType("centimeter"), arr2);
    test.assertEqual((cm1_arr + cm2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    test.assertEqual((m1 + cm1).value(), 1.01);
    test.assertEqual((cm1 + m1).value(), 101.0);
    test.assertEqual((m1_arr + cm1_arr).getArray(), [1.01, 2.02, 3.03, 4.04, 5.05]);
    test.assertEqual((cm1_arr + m1_arr).getArray(), [101.0, 202.0, 303.0, 404.0, 505.0]);
}

proc length_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var m = length(unitsystem.getLengthType("meter"), 1);
    var cm = length(unitsystem.getLengthType("centimeter"), 1);
    test.assertNotEqual(m, cm); 

    var arr1 = [1, 2, 3, 4, 5];    
    var arr2 = [0.01, 0.02, 0.03, 0.04, 0.05];

    var m1_arr = length(unitsystem.getLengthType("meter"), arr1);
    var cm1_arr = length(unitsystem.getLengthType("centimeter"), arr1);
    var res = m1_arr != cm1_arr;
    var testArr = [true, true, true, true, true];
    for (i, j) in zip(res, testArr) do
        test.assertEqual(i, j);    
        
    var m2 = 3 * m;
    test.assertEqual(m2.value(), 3);

    var m2_arr = 3 * m1_arr;
    test.assertEqual(m2_arr.getArray(), [3.0, 6.0, 9.0, 12.0, 15.0]);
}

UnitTest.main();