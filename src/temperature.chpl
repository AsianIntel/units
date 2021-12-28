module temperature {
    private use unit;

    record temperature {
        var dims: unit;
        var _value: real;
        var coefficient: real;
        var constant: real;
        var temperatureType: string;
        
        proc init(value: real, coefficient: real, constant: real, temperatureType: string) {  
            this.dims = new unit(0, 0, 0, 0, 1, 0, 0);          
            this._value = value;
            this.coefficient = coefficient;
            this.constant = constant;
            this.temperatureType = temperatureType;
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
    }

    proc kelvin(value: real): temperature {
        return new temperature(value, 1, 0, "kelvin");
    }

    proc celsius(value: real): temperature {
        return new temperature(value, 1, -273.15, "celsius");
    }

    proc fahrenheit(value: real): temperature {
        return new temperature(value, 9.0/5.0, -459.67, "fahrenheit")

    }  

    operator +(lhs: temperature, rhs: temperature): temperature {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new temperature(lhs._value + rhs_val, lhs.coefficient, lhs.constant, lhs.temperatureType);
    }

    operator *(lhs: real, inout rhs: temperature): temperature {
        rhs._value = rhs._value * lhs;
        return rhs;
    }

    operator ==(lhs: temperature, rhs: temperature): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }

    operator !=(lhs: temperature, rhs: temperature): bool {
        return !(lhs == rhs);
    }
}