module mass {
    private use unit;

    record mass {
        var dims: unit;
        var _value: real;
        var coefficient: real;
        var constant: real;
        var massType: string;
        
        proc init(value: real, coefficient: real, constant: real, massType: string) {  
            this.dims = new unit(0, 1, 0, 0, 0, 0, 0);          
            this._value = value;
            this.coefficient = coefficient;
            this.constant = constant;
            this.massType = massType;
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

    proc gram(value: real): mass {
        return new mass(value, 1, 0, "gram");
    }

    proc kilogram(value: real): mass {
        return new mass(value, 0.001, 0, "kilogram");
    }  

    operator +(lhs: mass, rhs: mass): mass {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new mass(lhs._value + rhs_val, lhs.coefficient, lhs.constant, lhs.massType);
    }

    operator -(lhs: mass, rhs: mass): mass {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new mass(lhs._value - rhs_val, lhs.coefficient, lhs.constant, lhs.massType);
    }

    operator *(lhs: real, inout rhs: mass): mass {
        rhs._value = rhs._value * lhs;
        return rhs;
    }

    operator ==(lhs: mass, rhs: mass): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }

    operator !=(lhs: mass, rhs: mass): bool {
        return !(lhs == rhs);
    }
}