use UnitTest;
use unit;
use unit_registry;
use luminous_intensity;

proc luminous_intensity_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var cd = luminous_intensity(unitsystem.getLumIntensityType("candela"), 1);
    var kcd = luminous_intensity(unitsystem.getLumIntensityType("kilocandela"), 1); 

    var arr1 = [1, 2, 3, 4, 5];
    var cd1_arr = luminous_intensity(unitsystem.getLumIntensityType("candela"), arr1);

    test.assertTrue(true);
}

proc luminous_intensity_addition(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var cd1 = luminous_intensity(unitsystem.getLumIntensityType("candela"), 1);
    var cd2 = luminous_intensity(unitsystem.getLumIntensityType("candela"), 2);
    test.assertEqual((cd1 + cd2).value(), 3.0);

    var kcd1 = luminous_intensity(unitsystem.getLumIntensityType("kilocandela"), 1);
    var kcd2 = luminous_intensity(unitsystem.getLumIntensityType("kilocandela"), 2);
    test.assertEqual((kcd1 + kcd2).value(), 3.0);

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [1, 1, 1, 1, 1];

    var cd1_arr = luminous_intensity(unitsystem.getLumIntensityType("candela"), arr1);
    var cd2_arr = luminous_intensity(unitsystem.getLumIntensityType("candela"), arr2);
    test.assertEqual((cd1_arr + cd2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    var kcd1_arr = luminous_intensity(unitsystem.getLumIntensityType("kilocandela"), arr1);
    var kcd2_arr = luminous_intensity(unitsystem.getLumIntensityType("kilocandela"), arr2);
    test.assertEqual((kcd1_arr + kcd2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    test.assertEqual((kcd1 + cd1).value(), 1.001);
    test.assertEqual((cd1 + kcd1).value(), 1001);    
    test.assertEqual((cd1_arr + kcd1_arr).getArray(), [1001.0, 2002.0, 3003.0, 4004.0, 5005.0]);
    test.assertEqual((kcd1_arr + cd1_arr).getArray(), [1.001, 2.002, 3.003, 4.004, 5.005]);
}

proc current_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var kcd = luminous_intensity(unitsystem.getLumIntensityType("kilocandela"), 1);
    var cd = luminous_intensity(unitsystem.getLumIntensityType("candela"), 1);
    test.assertNotEqual(kcd, cd);

    var arr1 = [1, 2, 3, 4, 5];

    var cd1_arr = luminous_intensity(unitsystem.getLumIntensityType("candela"), arr1);
    var kcd1_arr = luminous_intensity(unitsystem.getLumIntensityType("kilocandela"), arr1); 
    var res = cd1_arr != kcd1_arr;
    var testArr = [true, true, true, true, true];
    for (i, j) in zip(res, testArr) do
        test.assertEqual(i, j); 
    
    var kcd2 = 3 * kcd;
    test.assertEqual(kcd2.value(), 3);

    var kcd2_arr = 3 * kcd1_arr;
    test.assertEqual(kcd2_arr.getArray(), [3.0, 6.0, 9.0, 12.0, 15.0]);
}

UnitTest.main();