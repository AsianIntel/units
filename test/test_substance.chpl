use UnitTest;
use unit;
use unit_registry;
use substance;

proc substance_compile(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var mol = substance(unitsystem.getSubstanceType("mole"), 1);
    var mmol = substance(unitsystem.getSubstanceType("millimole"), 1);

    var arr1 = [1, 2, 3, 4, 5];
    var mol1_arr = substance(unitsystem.getSubstanceType("mole"), arr1);

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

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [1, 1, 1, 1, 1];

    var mol1_arr = substance(unitsystem.getSubstanceType("mole"), arr1);
    var mol2_arr = substance(unitsystem.getSubstanceType("mole"), arr2);
    test.assertEqual((mol1_arr + mol2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    var mmol1_arr = substance(unitsystem.getSubstanceType("millimole"), arr1);
    var mmol2_arr = substance(unitsystem.getSubstanceType("millimole"), arr2);
    test.assertEqual((mmol1_arr + mmol2_arr).getArray(), [2.0, 3.0, 4.0, 5.0, 6.0]);

    test.assertEqual((mol1 + mmol1).value(), 1.001);
    test.assertEqual((mmol1 + mol1).value(), 1001.0);
    test.assertEqual((mol1_arr + mmol1_arr).getArray(), [1.001, 2.002, 3.003, 4.004, 5.005]);
    test.assertEqual((mmol1_arr + mol1_arr).getArray(), [1001.0, 2002.0, 3003.0, 4004.0, 5005.0]);    
}

proc substance_operations(test: borrowed Test) throws {
    var unitsystem = set_unitSystem("MKS");

    var mol = substance(unitsystem.getSubstanceType("mole"), 1);
    var mmol = substance(unitsystem.getSubstanceType("millimole"), 1);
    test.assertNotEqual(mol, mmol);

    var arr1 = [1, 2, 3, 4, 5];
    var arr2 = [0.001, 0.002, 0.003, 0.004, 0.005];

    var mol1_arr = substance(unitsystem.getSubstanceType("mole"), arr1);
    var mmol1_arr = substance(unitsystem.getSubstanceType("millimole"), arr1);
    var res = mol1_arr != mmol1_arr;
    var testArr = [true, true, true, true, true];
    for (i, j) in zip(res, testArr) do
        test.assertEqual(i, j);

    var mol2 = 3 * mol;
    test.assertEqual(mol2.value(), 3);

    var mol2_arr = 3 * mol1_arr;
    test.assertEqual(mol2_arr.getArray(), [3.0, 6.0, 9.0, 12.0, 15.0]);
}

UnitTest.main();