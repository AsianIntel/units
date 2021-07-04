use UnitTest;
use unit;
use length;

proc length_compile(test: borrowed Test) throws {
    var m = new meter(1);
    var cm = new centimetre(1);
    test.assertTrue(true);
}

proc length_addition(test: borrowed Test) throws {
    var m1 = new meter(1);
    var m2 = new meter(2);
    test.assertEqual((m1 + m2).value(), 3.0);

    var cm1 = new centimetre(1);
    var cm2 = new centimetre(2);
    test.assertEqual((cm1 + cm2).value(), 3.0);

    test.assertEqual((m1 + cm1).value(), 1.01);
    test.assertEqual((cm1 + m1).value(), 101.0);
}

proc length_operations(test: borrowed Test) throws {
    var m = new meter(1);
    var cm = new centimetre(1);
    test.assertNotEqual(m, cm);

    var m2 = 3 * m;
    test.assertEqual(m2.value(), 3);
}

UnitTest.main();