module luminous_intensity {
    private use unit;
    private use unit_registry;
    private use marker;

    proc luminous_intensity(unitObj: shared AbstractUnitObj, in arr): unit_array {
        return new unit_array(luminousIntensityMarker(unitObj), arr);
    }

    proc luminous_intensity(unitObj: shared AbstractUnitObj, value: real): unit {
        return new unit(0, 0, 0, 0, 0, 0, 1, unitObj.getCoefficient(), unitObj.getConstant(), value, unitObj.getSymbol());
    }
    
    proc luminous_intensity(coefficient: real, constant: real, in arr, symbol: string): unit_array {
        return new unit_array(luminousIntensityMarker(coefficient, constant, symbol), arr);
    }

    proc luminous_intensity(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(0, 0, 0, 0, 0, 0, 1, coefficient, constant, value, symbol);
    }
}