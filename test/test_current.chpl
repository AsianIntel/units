use UnitTest;
use unit;
use electricalCurrent;

proc current_compile(test: borrowed Test) throws {
    var kA = new kiloampere(1);
    var A = new ampere(1);
    test.assertTrue(true);
}

proc current_addition(test: borrowed Test) throws {
    var kA1 = new kiloampere(1);
    var kA2 = new kiloampere(2);
    test.assertEqual((kA1 + kA2).value, 3);

    var A1 = new ampere(1);
    var A2 = new ampere(2);
    test.assertEqual((A1 + A2).value, 3);

    test.assertEqual((kA1 + A1).value, 1.001);
    test.assertEqual((A1 + kA1).value, 1001);
}

proc current_operations(test: borrowed Test) throws {
    var kA = new kiloampere(1);
    var A = new ampere(1);
    test.assertNotEqual(kA, A);

    var kA2 = 3 * kA;
    test.assertEqual(kA2.value, 3);
}

UnitTest.main();