module Unit_Registry {
    private use Map;
    
    class AbstractUnitObj {
        const unitCoefficient: real;        

        proc init(coefficient: real) {
            this.unitCoefficient = coefficient;                
        }

        proc getCoefficient(): real {
            halt("Virtual class method");
        }

        proc getConstant(): real {
            halt("Virtual class method");
        }

        proc getSymbol(): string {
            halt("Virtual class method");
        }
    }

    class UnitObj: AbstractUnitObj {
        const unitCoefficient: real;
        const unitConstant: real;
        var unitSymbol: string;

        proc init(coefficient: real, constant: real, symbol: string) {
            super.init(coefficient);
            this.unitCoefficient = coefficient;
            this.unitConstant = constant;
            this.unitSymbol = symbol;
        }

        override proc getCoefficient(): real {
            return unitCoefficient;
        }

        override proc getConstant(): real {
            return unitConstant;
        }

        override proc getSymbol(): string {
            return unitSymbol;
        }

    }

    var lengthRegistry: map(string, shared AbstractUnitObj);
    var massRegistry: map(string, shared AbstractUnitObj);
    var timeRegistry: map(string, shared AbstractUnitObj);
    var electricalCurrentRegistry: map(string, shared AbstractUnitObj);
    var temperatureRegistry: map(string, shared AbstractUnitObj);
    var substanceRegistry: map(string, shared AbstractUnitObj);
    var luminousIntensityRegistry: map(string, shared AbstractUnitObj);

    record unitregistry {
        var lengthUnitDict: map(string, shared AbstractUnitObj);
        var massUnitDict: map(string, shared AbstractUnitObj);
        var timeUnitDict: map(string, shared AbstractUnitObj);
        var electricalCurrentUnitDict: map(string, shared AbstractUnitObj);
        var temperatureUnitDict: map(string, shared AbstractUnitObj);
        var substanceUnitDict: map(string, shared AbstractUnitObj);
        var luminousIntensityUnitDict: map(string, shared AbstractUnitObj);        

        proc init(lengthDict: map(string, shared AbstractUnitObj), massDict: map(string, shared AbstractUnitObj), timeDict: map(string, shared AbstractUnitObj), elecCurrentDict: map(string, shared AbstractUnitObj), temperatureDict: map(string, shared AbstractUnitObj), substanceDict: map(string, shared AbstractUnitObj), lumIntensityDict: map(string, shared AbstractUnitObj)) {
            this.lengthUnitDict = lengthDict;
            this.massUnitDict = massDict;
            this.timeUnitDict = timeDict;
            this.electricalCurrentUnitDict = elecCurrentDict;
            this.temperatureUnitDict = temperatureDict;
            this.substanceUnitDict = substanceDict;
            this.luminousIntensityUnitDict = lumIntensityDict;
        }

        proc getLengthType(lengthType: string) {
            return this.lengthUnitDict.getValue(lengthType);            
        }  

        proc getMassType(massType: string) {
            return this.massUnitDict.getValue(massType);            
        }

        proc getTimeType(timeType: string) {
            return this.timeUnitDict.getValue(timeType);            
        }

        proc getECurrentType(eCurrentType: string) {
            return this.electricalCurrentUnitDict.getValue(eCurrentType);            
        }

        proc getTemperatureType(temperatureType: string) {
            return this.temperatureUnitDict.getValue(temperatureType);            
        }

        proc getSubstanceType(substanceType: string) {
            return this.substanceUnitDict.getValue(substanceType);            
        }

        proc getLumIntensityType(lumIntensityType: string) {
            return this.luminousIntensityUnitDict.getValue(lumIntensityType);            
        }

        proc setLengthType(lengthType: string, lengthCoeff: real, lengthConstant: real, lengthSymbol: string) {
            this.lengthUnitDict.addOrSet(lengthType, new UnitObj(lengthCoeff, lengthConstant, lengthSymbol));
        }      

        proc setMassType(massType: string, massCoeff: real, massConstant: real, massSymbol: string) {
            this.massUnitDict.addOrSet(massType, new UnitObj(massCoeff, massConstant, massSymbol));
        }

        proc setTimeType(timeType: string, timeCoeff: real, timeConstant: real, timeSymbol: string) {
            this.timeUnitDict.addOrSet(timeType, new UnitObj(timeCoeff, timeConstant, timeSymbol));
        }  

        proc setEcurrentType(eCurrentType: string, eCurrentCoeff: real, eCurrentConstant: real, eCurrentSymbol: string) {
            this.electricalCurrentUnitDict.addOrSet(eCurrentType, new UnitObj(eCurrentCoeff, eCurrentConstant, eCurrentSymbol));
        }

        proc setTemperatureType(temperatureType: string, temperatureCoeff: real, temperatureConstant: real, temperatureSymbol: string) {
            this.temperatureUnitDict.addOrSet(temperatureType, new UnitObj(temperatureCoeff, temperatureConstant, temperatureSymbol));
        }

        proc setSubtanceType(substanceType: string, substanceCoeff: real, substanceConstant: real, substanceSymbol: string) {
            this.substanceUnitDict.addOrSet(substanceType, new UnitObj(substanceCoeff, substanceConstant, substanceSymbol));
        }

        proc setLumIntensityType(lumIntensityType: string, lumIntensityCoeff: real, lumIntensityConstant: real, lumIntensitySymbol: string) {
            this.luminousIntensityUnitDict(lumIntensityType, new UnitObj(lumIntensityCoeff, lumIntensityConstant, lumIntensitySymbol));
        }

    }
}