module luminous_intensity {
    private use unit;
    private use unit_registry;

    proc luminous_intensity(unitObj: shared AbstractUnitObj, in arr): unit_array {
        return new unit_array(0, 0, 0, 0, 0, 0, 1, unitObj.getCoefficient(), unitObj.getConstant(), arr, unitObj.getSymbol());
    }

    proc luminous_intensity(unitObj: shared AbstractUnitObj, value: real): unit {
        return new unit(0, 0, 0, 0, 0, 0, 1, unitObj.getCoefficient(), unitObj.getConstant(), value, unitObj.getSymbol());
    }
    
    proc luminous_intensity(coefficient: real, constant: real, in arr, symbol: string): unit_array {
        return new unit_array(0, 0, 0, 0, 0, 0, 1, coefficient, constant, arr, symbol);
    }

    proc luminous_intensity(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(0, 0, 0, 0, 0, 0, 1, coefficient, constant, value, symbol);
    }
}