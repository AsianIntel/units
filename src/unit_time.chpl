module unit_time {
    private use unit;
    private use unit_registry;
    private use marker;

    proc time(unitObj: shared AbstractUnitObj, in arr): unit_array {
        return new unit_array(timeMarker(unitObj), arr);
    }

    proc time(unitObj: shared AbstractUnitObj, value: real): unit {
        return new unit(0, 0, 1, 0, 0, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), value, unitObj.getSymbol());
    }
    
    proc time(coefficient: real, constant: real, in arr, symbol: string): unit_array {
        return new unit_array(timeMarker(coefficient, constant, symbol), arr);
    }

    proc time(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(0, 0, 1, 0, 0, 0, 0, coefficient, constant, value, symbol);
    }
}