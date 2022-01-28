module unit {
    private use IO;

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

        proc init(param Length: int, param Mass: int, param Time: int, param ElectricCurrent: int, param Temperature: int, param Substance: int, param LuminousIntensity: int, param coefficient: real, param constant: real, value: real) {
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
            lhs._value + rhs_val);
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
            lhs._value - rhs_val);
    }    
}