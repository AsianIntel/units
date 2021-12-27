module length {
    private use unit;
    private use derived_unit;

    record length {
        var dims: unit;
        var _value: real;
        var coefficient: real;
        var constant: real;
        var lengthType: string;
        
        proc init(value: real, coefficient: real, constant: real, lengthType: string) {  
            this.dims = new unit(1, 0, 0, 0, 0, 0, 0);          
            this._value = value;
            this.coefficient = coefficient;
            this.constant = constant;
            this.lengthType = lengthType;
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

    proc meter(value: real, constant: real): length {
        return new length(value, 1, constant, "meter");
    }

    proc centimetre(value: real, constant: real): length {
        return new length(value, 100, constant, "centimetre");
    }   

    operator +(lhs: length, rhs: length): length {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new length(lhs._value + rhs_val, lhs.coefficient, lhs.constant, lhs.lengthType);
    }

    operator -(lhs: length, rhs: length): length {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new length(lhs._value - rhs_val, lhs.coefficient, lhs.constant, lhs.lengthType);
    }

    operator *(lhs: real, inout rhs: length): length {
        rhs._value = rhs._value * lhs;
        return rhs;
    }

    operator ==(lhs: length, rhs: length): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }

    operator !=(lhs: length, rhs: length): bool {
        return !(lhs == rhs);
    }    
}