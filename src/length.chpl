module Length {
    private use unit;
    private use unit_registry;

    proc length(unitObj: shared AbstractUnitObj, in arr): unit_array {
        return new unit_array(1, 0, 0, 0, 0, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), arr, unitObj.getSymbol());
    }

    proc length(unitObj: shared AbstractUnitObj, value: real): unit {
        return new unit(1, 0, 0, 0, 0, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), value, unitObj.getSymbol());
    }
    
    proc length(coefficient: real, constant: real, in arr, symbol: string): unit_array {
        return new unit_array(1, 0, 0, 0, 0, 0, 0, coefficient, constant, arr, symbol);
    }

    proc length(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(1, 0, 0, 0, 0, 0, 0, coefficient, constant, value, symbol);
    }
}