use UnitTest;
use unit;
use unit_registry;
use mass;

proc mass_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var k = mass(unitsystem.getMassType("kilogram"), 1);
    var g = mass(unitsystem.getMassType("gram"), 1);
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

    test.assertEqual((k1 + g1).value(), 1.001);
    test.assertEqual((g1 + k1).value(), 1001);
}

proc mass_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");
    
    var k = mass(unitsystem.getMassType("kilogram"), 1);
    var g = mass(unitsystem.getMassType("gram"), 1);
    test.assertNotEqual(k, g);

    var k2 = 3 * k;
    test.assertEqual(k2.value(), 3);
}

UnitTest.main();