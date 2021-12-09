module temperature {
    private use unit;

    class temperature: unit {
        var _value: real;
        var coefficient: real;
        var constant: real;
        
        proc init(value: real, coefficient: real, constant: real) {
            super.init(0, 0, 0, 0, 1, 0, 0);
            this._value = value;
            this.coefficient = coefficient;
            this.constant = constant;
        }

        override proc value(): real {
            return _value;
        }

        override proc coefficient(): real {
            return coefficient;
        }

        override proc constant(): real {
            return constant;
        }

        override proc from_base(val: real): real {
            return coefficient * val + constant;
        }

        override proc to_base(): real {
            return (_value - constant) / coefficient;
        }
    }

    class kelvin: temperature {
        proc init(value: real) {
            super.init(value, 1, 0);
        }
    }

    class celsius: temperature {
        proc init(value: real) {
            super.init(value, 1, -273.15);
        }
    }

    class fahrenheit: temperature {
        proc init(value: real) {
            super.init(value, 9.0/5.0, -459.67);
        }   
    }

    operator +(lhs: borrowed temperature, rhs: borrowed temperature): owned temperature {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new temperature(lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    }

    operator *(lhs: real, rhs: borrowed temperature): temperature {
        rhs._value = rhs._value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed temperature, rhs: borrowed temperature): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }

    operator !=(lhs: borrowed temperature, rhs: borrowed temperature): bool {
        return !(lhs == rhs);
    }
}