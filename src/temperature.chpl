module temperature {
    private use unit;
    private use unit_registry;
    private use marker;

    proc temperature(unitObj: shared AbstractUnitObj, in arr): unit_array {
        return new unit_array(temperatureMarker(unitObj), arr);
    }

    proc temperature(unitObj: shared AbstractUnitObj, value: real): unit {
        return new unit(0, 0, 0, 0, 1, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), value, unitObj.getSymbol());
    }
    
    proc temperature(coefficient: real, constant: real, in arr, symbol: string): unit_array {
        return new unit_array(temperatureMarker(coefficient, constant, symbol), arr);
    }

    proc temperature(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(0, 0, 0, 0, 1, 0, 0, coefficient, constant, value, symbol);
    }
}