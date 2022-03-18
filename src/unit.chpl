module unit {
    private use IO;
    private use unit_registry;

    record unit {
        param length: int;
        param mass: int;
        param time: int;
        param electric_current: int;
        param temperature: int;
        param substance: int;
        param luminous_intensity: int;
        param coefficient: real; 
        param constant: real;

        var _value: real;
        var symbol: string;

        proc value(): real {
            return _value;
        }

        proc getCoefficient(): real {
            return coefficient;
        }

        proc getConstant(): real {
            return constant;
        }   

        proc from_base(val: real): real {
            return coefficient * val + constant;
        }

        proc to_base(): real {
            return (_value - constant) / coefficient;
        }

        proc checkDims(other: unit) param {
            return (
                this.length == other.length &&
                this.mass == other.mass &&
                this.time == other.time &&
                this.electric_current == other.electric_current &&
                this.temperature == other.temperature &&
                this.substance == other.substance &&
                this.luminous_intensity == other.luminous_intensity
            );
        }

        proc convert_to(unitObj: shared AbstractUnitObj): unit {
            var unit_val = unitObj.getCoefficient() * this._value + unitObj.getConstant();            
            var unitArr = this.getArray();
            for i in unitArr.domain {
                unitArr[i] = unitObj.getCoefficient() * unitArr[i] + unitObj.getConstant();
            }

            return new unit(
                this.length,
                this.mass,
                this.time,
                this.electric_current,
                this.temperature,
                this.substance,
                this.luminous_intensity,
                unitObj.getCoefficient(),
                unitObj.getConstant(),
                unitArr,
                unit_val,
                unitObj.getSymbol());
        }

        proc writeThis(f) throws {
            f <~> "{dims = (" <~> this.length <~> ", " <~> this.mass <~> ", " <~> this.time <~> ", " <~> this.electric_current <~> ", " <~> this.temperature <~> ", " <~> this.substance <~> ", " <~> this.luminous_intensity <~> "), coefficient = " <~> this.coefficient <~> ", constant = " <~> this.constant <~> ", array = [" <~> this.arr <~> "]" <~> ", value = " <~> this._value <~> ", symbol = " <~> this.symbol <~> "}";
        }                               
    }

    record unit_array {
        param length: int;
        param mass: int;
        param time: int;
        param electric_current: int;
        param temperature: int;
        param substance: int;
        param luminous_intensity: int;
        const coefficient: real; 
        const constant: real;
        //testing
        type eltType;
        param rank: int;
        param stridable: bool;
        var dom: domain(rank, stridable = stridable);
        var arr: [dom] eltType;

        proc getArray(): real {
            return arr;
        }

        proc getCoefficient(): real {
            return coefficient;
        }

        proc getConstant(): real {
            return constant;
        }   

        proc from_base(val: real): real {
            return coefficient * val + constant;
        }

        proc to_base(val: real): real {
            return (val - constant) / coefficient;
        }

        proc checkDims(other: unit_array) param {
            return (
                this.length == other.length &&
                this.mass == other.mass &&
                this.time == other.time &&
                this.electric_current == other.electric_current &&
                this.temperature == other.temperature &&
                this.substance == other.substance &&
                this.luminous_intensity == other.luminous_intensity
            );
        }
    }

    proc set_unitSystem(systemName: string): unitregistry {
        if (systemName == "MKS") {
            lengthRegistry.add("meter", new shared UnitObj(1, 0, "m"));
            lengthRegistry.add("centimeter", new shared UnitObj(100, 0, "cm"));

            massRegistry.add("kilogram", new shared UnitObj(1, 0, "kg"));
            massRegistry.add("gram", new shared UnitObj(1000, 0, "g"));

            timeRegistry.add("second", new shared UnitObj(1, 0, "s"));
            timeRegistry.add("minute", new shared UnitObj(0.0166666667, 0, "min"));

            electricalCurrentRegistry.add("ampere", new shared UnitObj(1, 0, "A"));
            electricalCurrentRegistry.add("kiloampere", new shared UnitObj(0.001, 0, "kA"));

            temperatureRegistry.add("kelvin", new shared UnitObj(1, 0, "K"));
            temperatureRegistry.add("celsius", new shared UnitObj(1, -273.15, "C"));
            temperatureRegistry.add("fahrenheit", new shared UnitObj(9.0/5.0, -459.67, "F"));

            substanceRegistry.add("mole", new shared UnitObj(1, 0, "mol"));
            substanceRegistry.add("millimole", new shared UnitObj(1000, 0, "mmol"));

            luminousIntensityRegistry.add("candela", new shared UnitObj(1, 0, "cd"));
            luminousIntensityRegistry.add("kilocandela", new shared UnitObj(0.001, 0, "kcd"));

            return new unitregistry(lengthRegistry, massRegistry, timeRegistry, electricalCurrentRegistry, temperatureRegistry, substanceRegistry, luminousIntensityRegistry);

        } else if (systemName == "CGS") {
            lengthRegistry.add("meter", new shared UnitObj(0.01, 0, "m"));
            lengthRegistry.add("centimeter", new shared UnitObj(1, 0, "cm"));

            massRegistry.add("kilogram", new shared UnitObj(0.001, 0, "kg"));
            massRegistry.add("gram", new shared UnitObj(1, 0, "g"));

            timeRegistry.add("second", new shared UnitObj(1, 0, "s"));
            timeRegistry.add("minute", new shared UnitObj(0.0166666667, 0, "min"));

            electricalCurrentRegistry.add("ampere", new shared UnitObj(3.33564e-10, 0, "A"));
            electricalCurrentRegistry.add("statampere", new shared UnitObj(1, 0, "statA"));

            temperatureRegistry.add("kelvin", new shared UnitObj(1, 0, "K"));
            temperatureRegistry.add("celsius", new shared UnitObj(1, -273.15, "C"));
            temperatureRegistry.add("fahrenheit", new shared UnitObj(9.0/5.0, -459.67, "F"));

            substanceRegistry.add("mole", new shared UnitObj(1, 0, "mol"));
            substanceRegistry.add("millimole", new shared UnitObj(1000, 0, "mmol"));

            luminousIntensityRegistry.add("candela", new shared UnitObj(1, 0, "cd"));
            luminousIntensityRegistry.add("kilocandela", new shared UnitObj(0.001, 0, "kcd"));

            return new unitregistry(lengthRegistry, massRegistry, timeRegistry, electricalCurrentRegistry, temperatureRegistry, substanceRegistry, luminousIntensityRegistry);

        } else {
            halt("Sorry some undefined UnitSystem!!");
        }
    }

    operator +(lhs: unit, rhs: unit): owned unit {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new unit(
            lhs.length,
            lhs.mass,
            lhs.time,
            lhs.electric_current,
            lhs.temperature,
            lhs.substance,
            lhs.luminous_intensity,           
            lhs.coefficient,
            lhs.constant,    
            lhs.coefficient, 
            lhs.constant,
            lhs._value + rhs_val,
            lhs.symbol
        );
    }

    operator +(lhs: unit_array, rhs: unit_array): unit_array where lhs.rank == rhs.rank && lhs.checkDims(rhs) {
        var rhsArr = rhs.getArray();        
        for i in rhsArr.domain {
            var rhs_val = lhs.from_base(rhs.to_base(rhs.arr[i]));
            rhsArr[i] = rhs_val;
        }
        
        return new unit_array(
            lhs.length,
            lhs.mass,
            lhs.time,
            lhs.electric_current,
            lhs.temperature,
            lhs.substance,
            lhs.luminous_intensity,           
            lhs.coefficient,
            lhs.constant,            
            lhs.arr + rhsArr,
            lhs.symbol);
    }

    operator -(lhs: unit, rhs: unit): owned unit {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new unit(
            lhs.length,
            lhs.mass,
            lhs.time,
            lhs.electric_current,
            lhs.temperature,
            lhs.substance,
            lhs.luminous_intensity,           
            lhs.coefficient,
            lhs.constant,    
            lhs.coefficient, 
            lhs.constant,
            lhs._value - rhs_val,
            lhs.symbol
        );
    }

    operator -(lhs: unit_array, rhs: unit_array): unit_array where lhs.rank == rhs.rank && lhs.checkDims(rhs) {
        var rhsArr = rhs.getArray();        
        for i in rhsArr.domain {
            var rhs_val = lhs.from_base(rhs.to_base(rhs.arr[i]));
            rhsArr[i] = rhs_val;
        }
        
        return new unit_array(
            lhs.length,
            lhs.mass,
            lhs.time,
            lhs.electric_current,
            lhs.temperature,
            lhs.substance,
            lhs.luminous_intensity,           
            lhs.coefficient,
            lhs.constant,            
            lhs.arr - rhsArr,
            lhs.symbol
        );
    }  

    operator ==(lhs: unit, rhs: unit): bool where lhs.checkDims(rhs) {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }  

    operator ==(lhs: unit_array, rhs: unit_array): bool where lhs.checkDims(rhs) {
        var rhsArr = rhs.getArray();        
        for i in rhsArr.domain {
            var rhs_val = lhs.from_base(rhs.to_base(rhs.arr[i]));
            rhsArr[i] = rhs_val;
        }
        
        return lhs.arr == rhsArr;
    }

    operator !=(lhs: unit, rhs: unit): bool where lhs.checkDims(rhs) {
        return !(lhs == rhs);
    }

    operator !=(lhs: unit_array, rhs: unit_array): bool where lhs.checkDims(rhs) {
        return !(lhs == rhs);
    }

    operator *(lhs: real, rhs: unit): unit_array {        
        return new unit_array(
            rhs.length,
            rhs.mass,
            rhs.time,
            rhs.electric_current,
            rhs.temperature,
            rhs.substance,
            rhs.luminous_intensity,
            rhs.coefficient,
            rhs.constant,
            lhs * rhs._value,
            rhs.symbol
        );
    }

    operator *(lhs: real, rhs: unit_array): unit_array {        
        return new unit_array(
            rhs.length,
            rhs.mass,
            rhs.time,
            rhs.electric_current,
            rhs.temperature,
            rhs.substance,
            rhs.luminous_intensity,
            rhs.coefficient,
            rhs.constant,
            lhs * rhs.arr,
            rhs.symbol
        );
    }

    operator *(lhs: unit, rhs: unit): owned unit {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new unit(
            lhs.length,
            lhs.mass,
            lhs.time,
            lhs.electric_current,
            lhs.temperature,
            lhs.substance,
            lhs.luminous_intensity,           
            lhs.coefficient,
            lhs.constant,    
            lhs.coefficient, 
            lhs.constant,
            lhs._value * rhs_val,
            lhs.symbol
        );
    }

    operator *(lhs: unit_array, rhs: unit_array): unit_array where lhs.rank == rhs.rank {
        var rhsArr = rhs.getArray();        
        for i in rhsArr.domain {
            var rhs_val = lhs.from_base(rhs.to_base(rhs.arr[i]));
            rhsArr[i] = rhs_val;
        }

        return new unit_array(
            lhs.length + rhs.length,
            lhs.mass + rhs.mass,
            lhs.time + rhs.time,
            lhs.electric_current + rhs.electric_current,
            lhs.temperature + rhs.temperature,
            lhs.substance + rhs.substance,
            lhs.luminous_intensity + rhs.luminous_intensity,
            1,
            0,
            lhs.arr * rhsArr,
            "derived_unit"
        );
    }

    operator /(lhs: unit, rhs: real): unit_array {        
        return new unit_array(
            lhs.length,
            lhs.mass,
            lhs.time,
            lhs.electric_current,
            lhs.temperature,
            lhs.substance,
            lhs.luminous_intensity,
            lhs.coefficient,
            lhs.constant,
            lhs._value / rhs,
            lhs.symbol
        );
    }

    operator /(lhs: unit_array, rhs: real): unit_array {        
        return new unit_array(
            lhs.length,
            lhs.mass,
            lhs.time,
            lhs.electric_current,
            lhs.temperature,
            lhs.substance,
            lhs.luminous_intensity,
            lhs.coefficient,
            lhs.constant,
            lhs.arr / rhs,
            lhs.symbol
        );
    }
}