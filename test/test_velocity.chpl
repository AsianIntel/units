use UnitTest;
use Math;
use velocity;
use length;
use unit_time;

config const epsilon: real = 10e-6;

proc velocity_length_time(test: borrowed Test) throws {
    var m = new meter(100);
    var s = new second(120);

    var cm = new centimetre(10000);
    var min = new minute(2);

    var vel = (m/s - cm/min);
    test.assertLessThan(abs(vel.value), epsilon);

    var v1 = new meter_per_second(5.0/6.0);
    test.assertLessThan(abs((v1 - m/s).value), epsilon);
}

UnitTest.main();