module Length {
    private use unit;
    private use Unit_Registry;

    proc length(unitObj: shared AbstractUnitObj, constant: real, in arr, value: real): unit {
        return new unit(1, 0, 0, 0, 0, 0, 0, unitObj.getCoefficient(), constant, arr, value, unitObj.getSymbol());
    }

    proc length(unitObj: shared AbstractUnitObj, in arr, value: real): unit {
        return new unit(1, 0, 0, 0, 0, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), arr, value, unitObj.getSymbol());
    }
    
    proc length(coefficient: real, constant: real, in arr, value: real, symbol: string): unit {
        return new unit(1, 0, 0, 0, 0, 0, 0, coefficient, constant, arr, value, symbol);
    }   

    proc length(unitObj: shared AbstractUnitObj, size: domain, in defaultValue, value: real): unit {
        return new unit(1, 0, 0, 0, 0, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), size, defaultValue, value, unitObj.getSymbol());
    }   

    proc length(coefficient: real, constant: real, size: domain, in defaultValue, value: real, symbol: string): unit {
        return new unit(1, 0, 0, 0, 0, 0, 0, coefficient, constant, size, defaultValue, value, symbol);
    }  
}