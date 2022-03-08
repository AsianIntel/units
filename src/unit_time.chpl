module Unit_time {
    private use unit;
    private use Unit_Registry;

    proc time(unitObj: shared AbstractUnitObj, constant: real, in arr, value: real): unit {
        return new unit(0, 0, 1, 0, 0, 0, 0, unitObj.getCoefficient(), constant, arr, value, unitObj.getSymbol());
    }

    proc time(unitObj: shared AbstractUnitObj, in arr, value: real): unit {
        return new unit(0, 0, 1, 0, 0, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), arr, value, unitObj.getSymbol());
    }

    proc time(coefficient: real, constant: real, in arr, value: real, symbol: string): unit {
        return new unit(0, 0, 1, 0, 0, 0, 0, coefficient, constant, arr, value, symbol);
    }    
}