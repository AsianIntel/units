use UnitTest;
use unit;
use unit_registry;
use unit_time;
use Math;

config const epsilon: real = 10e-6;

proc time_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var s = time(unitsystem.getTimeType("second"), 1);
    var m = time(unitsystem.getTimeType("minute"), 1);
    test.assertTrue(true);
}

proc time_addition(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var s1 = time(unitsystem.getTimeType("second"), 1);
    var s2 = time(unitsystem.getTimeType("second"), 2);
    test.assertEqual((s1 + s2).value(), 3.0);

    var m1 = time(unitsystem.getTimeType("minute"), 1);
    var m2 = time(unitsystem.getTimeType("minute"), 2);
    test.assertEqual((m1 + m2).value(), 3.0);

    test.assertLessThan(abs((s1 + m1).value() - 61.0), epsilon);
    test.assertLessThan(abs((m1 + s1).value() - 1.01667), epsilon);
}

proc time_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var s = time(unitsystem.getTimeType("second"), 1);
    var m = time(unitsystem.getTimeType("minute"), 1);
    test.assertNotEqual(s, m);

    var m2 = 3 * m;
    test.assertEqual(m2.value(), 3);
}

UnitTest.main();