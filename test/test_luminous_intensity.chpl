use UnitTest;
use unit;
use unit_registry;
use luminous_intensity;

proc luminous_intensity_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var cd = luminous_intensity(unitsystem.getLumIntensityType("candela"), 1);
    var kcd = luminous_intensity(unitsystem.getLumIntensityType("kilocandela"), 1);    
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

    test.assertEqual((kcd1 + cd1).value(), 1.001);
    test.assertEqual((cd1 + kcd1).value(), 1001);    
}

proc current_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var kcd = luminous_intensity(unitsystem.getLumIntensityType("kilocandela"), 1);
    var cd = luminous_intensity(unitsystem.getLumIntensityType("candela"), 1);
    test.assertNotEqual(kcd, cd);

    var kcd2 = 3 * kcd;
    test.assertEqual(kcd2.value(), 3);
}

UnitTest.main();