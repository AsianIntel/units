use UnitTest;
use unit;
use substance;

proc substance_compile(test: borrowed Test) throws {
    var mol = new mole(1);
    var mmol = new millimole(1);
    test.assertTrue(true);
}

proc substance_addition(test: borrowed Test) throws {
    var mol1 = new mole(1);
    var mol2 = new mole(2);
    test.assertEqual((mol1 + mol2).value(), 3.0);

    var mmol1 = new millimole(1);
    var mmol2 = new millimole(2);
    test.assertEqual((mmol1 + mmol2).value(), 3.0);

    test.assertEqual((mol1 + mmol1).value(), 1.001);
    test.assertEqual((mmol1 + mol1).value(), 1001.0);
}

proc substance_operations(test: borrowed Test) throws {
    var mol = new mole(1);
    var mmol = new millimole(1);
    test.assertNotEqual(mol, mmol);

    var mol2 = 3 * mol;
    test.assertEqual(mol2.value(), 3);
}

UnitTest.main();