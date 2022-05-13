use UnitTest;
use unit;
use unit_registry;
use length;

proc length_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var m = length(unitsystem.getLengthType("meter"), 1);
    var cm = length(unitsystem.getLengthType("centimeter"), 1);
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

    test.assertEqual((m1 + cm1).value(), 1.01);
    test.assertEqual((cm1 + m1).value(), 101.0);
}

proc length_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var m = length(unitsystem.getLengthType("meter"), 1);
    var cm = length(unitsystem.getLengthType("centimeter"), 1);
    test.assertNotEqual(m, cm);

    var m2 = 3 * m;
    test.assertEqual(m2.value(), 3);
}

UnitTest.main();