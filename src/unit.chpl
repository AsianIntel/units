module unit {
    private use IO;
    private use Unit_Registry;

    record unit {
        param length: int;
        param mass: int;
        param time: int;
        param electric_current: int;
        param temperature: int;
        param substance: int;
        param luminous_intensity: int;
        const coefficient: real; 
        const constant: real;
        var _value: real;
        var symbol: string;

        proc init(param Length: int, param Mass: int, param Time: int, param ElectricCurrent: int, param Temperature: int, param Substance: int, param LuminousIntensity: int, coefficient: real, constant: real, value: real, symbol: string) {
            this.length = Length;
            this.mass = Mass;
            this.time = Time;
            this.electric_current = ElectricCurrent;
            this.temperature = Temperature;
            this.substance = Substance;
            this.luminous_intensity = LuminousIntensity;
            this.coefficient = coefficient;
            this.constant = constant;
            this._value = value;
            this.symbol = symbol;
        }

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

        proc writeThis(f) throws {
            f <~> "{dims = (" <~> this.length <~> ", " <~> this.mass <~> ", " <~> this.time <~> ", " <~> this.electric_current <~> ", " <~> this.temperature <~> ", " <~> this.substance <~> ", " <~> this.luminous_intensity <~> "), coefficient = " <~> this.coefficient <~> ", constant = " <~> this.constant <~> ", value = " <~> this._value <~> ", symbol = " <~> this.symbol <~> "}";
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

    operator +(lhs: unit, rhs: unit): unit where lhs.checkDims(rhs) {
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
            lhs._value + rhs_val,
            lhs.symbol);
    }

    operator -(lhs: unit, rhs: unit): unit where lhs.checkDims(rhs) {
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
            lhs._value - rhs_val,
            lhs.symbol);
    }    
}