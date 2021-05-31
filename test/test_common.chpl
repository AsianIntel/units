use UnitTest;
use unit;
use length;
use temperature;

proc test_dims(test: borrowed Test) throws {
    var m = new meter(1);
    var k = new kelvin(1);
    var c = new centimetre(1);

    test.assertFalse(m.dims(k));
    test.assertTrue(m.dims(c));
}

UnitTest.main();