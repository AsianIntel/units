use UnitTest;
use unit_time;

proc time_compile(test: borrowed Test) throws {
    var s = new second(1);
    var m = new minute(1);
    test.assertTrue(true);
}

proc time_addition(test: borrowed Test) throws {
    var s1 = new second(1);
    var s2 = new second(2);
    test.assertEqual((s1 + s2).value, 3.0);

    var m1 = new minute(1);
    var m2 = new minute(2);
    test.assertEqual((m1 + m2).value, 3.0);

    test.assertEqual((s1 + m1).value, 61);
    test.assertEqual((m1 + s1).value, 1.01667);
}

proc time_operations(test: borrowed Test) throws {
    var s = new second(1);
    var m = new minute(1);
    test.assertNotEqual(s, m);

    var m2 = 3 * m;
    test.assertEqual(m2.value, 3);
}

UnitTest.main();