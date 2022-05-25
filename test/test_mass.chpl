use UnitTest;
use unit;
use unit_registry;
use mass;

proc mass_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var k = mass(unitsystem.getMassType("kilogram"), 1);
    var g = mass(unitsystem.getMassType("gram"), 1);

    var arr1 = [1, 2, 3, 4, 5];
    var k1_arr = mass(unitsystem.getMassType("kilogram"), arr1);
    test.assertTrue(true);
}

proc mass_addition(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var k1 = mass(unitsystem.getMassType("kilogram"), 1);
    var k2 = mass(unitsystem.getMassType("kilogram"), 2);
    test.assertEqual((k1 + k2).value(), 3);

    var g1 = mass(unitsystem.getMassType("gram"), 1);
    var g2 = mass(unitsystem.getMassType("gram"), 2);
    test.assertEqual((g1 + g2).value(), 3);

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [1, 1, 1, 1, 1];

    var k1_arr = mass(unitsystem.getMassType("kilogram"), arr1);
    var k2_arr = mass(unitsystem.getMassType("kilogram"), arr2);
    test.assertEqual((k1_arr + k2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    var g1_arr = mass(unitsystem.getMassType("gram"), arr1);
    var g2_arr = mass(unitsystem.getMassType("gram"), arr2);
    test.assertEqual((g1_arr + g2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    test.assertEqual((k1 + g1).value(), 1.001);
    test.assertEqual((g1 + k1).value(), 1001);
    test.assertEqual((k1_arr + g1_arr).getArray(), [1.001, 2.002, 3.003, 4.004, 5.005]);
    test.assertEqual((g1_arr + k1_arr).getArray(), [1001.0, 2002.0, 3003.0, 4004.0, 5005.0]);
}

proc mass_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");
    
    var k = mass(unitsystem.getMassType("kilogram"), 1);
    var g = mass(unitsystem.getMassType("gram"), 1);
    test.assertNotEqual(k, g);

    var arr1 = [1, 2, 3, 4, 5];    
    var arr2 = [0.001, 0.002, 0.003, 0.004, 0.005];

    var k1_arr = mass(unitsystem.getMassType("kilogram"), arr1);
    var g1_arr = mass(unitsystem.getMassType("gram"), arr1);
    var res = k1_arr != g1_arr;
    var testArr = [true, true, true, true, true];
    for (i, j) in zip(res, testArr) do
        test.assertEqual(i, j);

    var k2 = 3 * k;
    test.assertEqual(k2.value(), 3);

    var k2_arr = 3 * k1_arr;
    test.assertEqual(k2_arr.getArray(), [3.0, 6.0, 9.0, 12.0, 15.0]);
}

UnitTest.main();