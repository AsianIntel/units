use UnitTest;
use unit;
use derived_unit;

proc derived_unit_compile(test: borrowed Test) throws {
    var velocity = new derived_unit(1, 0, -1, 0, 0, 0, 0, 1, 1, 0);
    test.assertTrue(true);
}

proc derived_unit_addition(test: borrowed Test) throws {
    var v1 = new derived_unit(1, 0, -1, 0, 0, 0, 0, 1, 1, 0);
    var v2 = new derived_unit(1, 0, -1, 0, 0, 0, 0, 2, 1, 0);
    test.assertEqual((v1 + v2).value(), 3);
}

proc derived_unit_operarions(test: borrowed Test) throws {
    var v1 = new derived_unit(1, 0, -1, 0, 0, 0, 0, 1, 1, 0);
    var v2 = new derived_unit(1, 0, -1, 0, 0, 0, 0, 1, 1000, 0);
    test.assertNotEqual(v1, v2);

    var v3 = 3 * v1;
    test.assertEqual(v3.value(), 3);
}

UnitTest.main();