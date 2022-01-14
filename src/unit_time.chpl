module unit_time {
    private use unit;

    record time {
        var dims: unit;
        var _value: real;
        var coefficient: real;
        var constant: real;        
        
        proc init(value: real, coefficient: real, constant: real) {  
            this.dims = new unit(0, 0, 1, 0, 0, 0, 0);          
            this._value = value;
            this.coefficient = coefficient;
            this.constant = constant;            
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

    proc second(value: real): time {
        return new time(value, 1, 0);
    }

    proc minute(value: real): time {
        return new time(value, 0.0166666667, 0);
    }   

    operator +(lhs: time, rhs: time): time {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new time(lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    }

    operator -(lhs: time, rhs: time): time {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new time(lhs._value - rhs_val, lhs.coefficient, lhs.constant);
    }

    operator *(lhs: real, inout rhs: time): time {
        rhs._value = rhs._value * lhs;
        return rhs;
    }

    operator ==(lhs: time, rhs: time): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }

    operator !=(lhs: time, rhs: time): bool {
        return !(lhs == rhs);
    }
}