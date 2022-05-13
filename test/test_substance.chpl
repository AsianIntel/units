use UnitTest;
use unit;
use unit_registry;
use substance;

proc substance_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var mol = substance(unitsystem.getSubstanceType("mole"), 1);
    var mmol = substance(unitsystem.getSubstanceType("millimole"), 1);
    test.assertTrue(true);
}

proc substance_addition(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var mol1 = substance(unitsystem.getSubstanceType("mole"), 1);
    var mol2 = substance(unitsystem.getSubstanceType("mole"), 2);
    test.assertEqual((mol1 + mol2).value(), 3.0);

    var mmol1 = substance(unitsystem.getSubstanceType("millimole"), 1);
    var mmol2 = substance(unitsystem.getSubstanceType("millimole"), 2);
    test.assertEqual((mmol1 + mmol2).value(), 3.0);

    test.assertEqual((mol1 + mmol1).value(), 1.001);
    test.assertEqual((mmol1 + mol1).value(), 1001.0);
}

proc substance_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var mol = substance(unitsystem.getSubstanceType("mole"), 1);
    var mmol = substance(unitsystem.getSubstanceType("millimole"), 1);
    test.assertNotEqual(mol, mmol);

    var mol2 = 3 * mol;
    test.assertEqual(mol2.value(), 3);
}

UnitTest.main();