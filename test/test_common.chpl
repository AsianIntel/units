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

proc test_dims_unitArray(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var arr1 = [1, 2, 3, 4, 5];
    var m1_arr = length(unitsystem.getLengthType("meter"), arr1);
    var k1_arr = temperature(unitsystem.getTemperatureType("kelvin"), arr1);
    var c1_arr = length(unitsystem.getLengthType("centimeter"), arr1);

    test.assertFalse(m1_arr.Marker.checkDims(k1_arr.Marker));
    test.assertTrue(m1_arr.Marker.checkDims(c1_arr.Marker));

}

UnitTest.main();