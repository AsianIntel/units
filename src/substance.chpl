module substance {
    private use unit;
    private use unit_registry;
    private use marker;

    proc substance(unitObj: shared AbstractUnitObj, in arr): unit_array {
        return new unit_array(substanceMarker(unitObj), arr);
    }

    proc substance(unitObj: shared AbstractUnitObj, value: real): unit {
        return new unit(0, 0, 0, 0, 0, 1, 0, unitObj.getCoefficient(), unitObj.getConstant(), value, unitObj.getSymbol());
    }
    
    proc substance(coefficient: real, constant: real, in arr, symbol: string): unit_array {
        return new unit_array(substanceMarker(coefficient, constant, symbol), arr);
    }

    proc substance(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(0, 0, 0, 0, 0, 1, 0, coefficient, constant, value, symbol);
    }
}