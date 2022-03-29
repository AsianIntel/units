module substance {
    private use unit;
    private use unit_registry;

    proc substance(unitObj: shared AbstractUnitObj, in arr): unit_array {
        return new unit_array(0, 0, 0, 0, 0, 1, 0, unitObj.getCoefficient(), unitObj.getConstant(), arr, unitObj.getSymbol());
    }

    proc substance(unitObj: shared AbstractUnitObj, value: real): unit {
        return new unit(0, 0, 0, 0, 0, 1, 0, unitObj.getCoefficient(), unitObj.getConstant(), value, unitObj.getSymbol());
    }
    
    proc substance(coefficient: real, constant: real, in arr, symbol: string): unit_array {
        return new unit_array(0, 0, 0, 0, 0, 1, 0, coefficient, constant, arr, symbol);
    }

    proc substance(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(0, 0, 0, 0, 0, 1, 0, coefficient, constant, value, symbol);
    }
}