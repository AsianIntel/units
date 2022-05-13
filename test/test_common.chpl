use UnitTest;
use unit_registry;
use unit;
use length;
use temperature;

proc test_dims(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var m = length(unitsystem.getLengthType("meter"), 1);
    var k = temperature(unitsystem.getTemperatureType("kelvin"), 1);
    var c = length(unitsystem.getLengthType("centimeter"), 1);

    test.assertFalse(m.checkDims(k));
    test.assertTrue(m.checkDims(c));
}

UnitTest.main();