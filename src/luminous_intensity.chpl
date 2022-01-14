module luminous_intensity {
    private use unit;

    record luminous_intensity {
        var dims: unit;
        var _value: real;
        var coefficient: real;
        var constant: real;        
        
        proc init(value: real, coefficient: real, constant: real) {  
            this.dims = new unit(0, 0, 0, 0, 0, 0, 1);          
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

    proc candela(value: real): luminous_intensity {
        return new luminous_intensity(value, 1, 0);
    }

    proc kilocandela(value: real): luminous_intensity {
        return new luminous_intensity(value, 0.001, 0);
    }   
    
    operator +(lhs: luminous_intensity, rhs: luminous_intensity): luminous_intensity {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new luminous_intensity(lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    }

    operator -(lhs: luminous_intensity, rhs: luminous_intensity): luminous_intensity {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new luminous_intensity(lhs._value - rhs_val, lhs.coefficient, lhs.constant);
    }

    operator *(lhs: real, inout rhs: luminous_intensity): luminous_intensity {
        rhs._value = rhs._value * lhs;
        return rhs;
    }

    operator ==(lhs: luminous_intensity, rhs: luminous_intensity): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }

    operator !=(lhs: luminous_intensity, rhs: luminous_intensity): bool {
        return !(lhs == rhs);
    }
}