use UnitTest;
use unit;
use unit_registry;
use electric_current;

proc current_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var kA = electric_current(unitsystem.getECurrentType("kiloampere"), 1);
    var A = electric_current(unitsystem.getECurrentType("ampere"), 1);
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

    test.assertEqual((kA1 + A1).value(), 1.001);
    test.assertEqual((A1 + kA1).value(), 1001);
}

proc current_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var kA = electric_current(unitsystem.getECurrentType("kiloampere"), 1);
    var A = electric_current(unitsystem.getECurrentType("ampere"), 1);
    test.assertNotEqual(kA, A);

    var kA2 = 3 * kA;
    test.assertEqual(kA2.value(), 3);
}

UnitTest.main();