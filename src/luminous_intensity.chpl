module Luminous_intensity {
    private use unit;
    private use Unit_Registry;

    proc luminous_intensity(unitObj: shared AbstractUnitObj, constant: real, in arr, value: real): unit {
        return new unit(0, 0, 0, 0, 0, 0, 1, unitObj.getCoefficient(), constant, arr, value, unitObj.getSymbol());
    }

    proc luminous_intensity(unitObj: shared AbstractUnitObj, in arr, value: real): unit {
        return new unit(0, 0, 0, 0, 0, 0, 1, unitObj.getCoefficient(), unitObj.getConstant(), arr, value, unitObj.getSymbol());
    }

    proc luminous_intensity(coefficient: real, constant: real, in arr, value: real, symbol: string): unit {
        return new unit(0, 0, 0, 0, 0, 0, 1, coefficient, constant, arr, value, symbol);
    }    
}