module marker {
    private use unit_registry;

    record UnitMarker {
        param length: int;
        param mass: int;
        param time: int;
        param electric_current: int;
        param temperature: int;
        param substance: int;
        param luminous_intensity: int;
        const coefficient: real; 
        const constant: real;
        var symbol: string;

        proc getCoefficient(): real {
            return coefficient;
        }

        proc getConstant(): real {
            return constant;
        }

        proc getSymbol(): string {
            return symbol;
        }

        proc checkDims(otherMarker: UnitMarker) param {
            return (
                this.length == otherMarker.length &&
                this.mass == otherMarker.mass &&
                this.time == otherMarker.time &&
                this.electric_current == otherMarker.electric_current &&
                this.temperature == otherMarker.temperature &&
                this.substance == otherMarker.substance &&
                this.luminous_intensity == otherMarker.luminous_intensity
            );
        }
    }    

    proc lengthMarker(unitObj: shared AbstractUnitObj): UnitMarker {
        return new UnitMarker(1, 0, 0, 0, 0, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), unitObj.getSymbol());
    }

    proc massMarker(unitObj: shared AbstractUnitObj): UnitMarker {
        return new UnitMarker(0, 1, 0, 0, 0, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), unitObj.getSymbol());
    }

    proc timeMarker(unitObj: shared AbstractUnitObj): UnitMarker {
        return new UnitMarker(0, 0, 1, 0, 0, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), unitObj.getSymbol());
    }
    
    proc electricCurrentMarker(unitObj: shared AbstractUnitObj): UnitMarker {
        return new UnitMarker(0, 0, 0, 1, 0, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), unitObj.getSymbol());
    }

    proc temperatureMarker(unitObj: shared AbstractUnitObj): UnitMarker {
        return new UnitMarker(0, 0, 0, 0, 1, 0, 0, unitObj.getCoefficient(), unitObj.getConstant(), unitObj.getSymbol());
    }

    proc substanceMarker(unitObj: shared AbstractUnitObj): UnitMarker {
        return new UnitMarker(0, 0, 0, 0, 0, 1, 0, unitObj.getCoefficient(), unitObj.getConstant(), unitObj.getSymbol());
    }

    proc luminousIntensityMarker(unitObj: shared AbstractUnitObj): UnitMarker {
        return new UnitMarker(0, 0, 0, 0, 0, 0, 1, unitObj.getCoefficient(), unitObj.getConstant(), unitObj.getSymbol());
    }    
}