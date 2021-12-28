module substance {
    private use unit;

    record substance {
        var dims: unit;
        var _value: real;
        var coefficient: real;
        var constant: real;
        var substanceType: string;
        
        proc init(value: real, coefficient: real, constant: real, substanceType: string) {  
            this.dims = new unit(0, 0, 0, 0, 0, 1, 0);          
            this._value = value;
            this.coefficient = coefficient;
            this.constant = constant;
            this.substanceType = substanceType;
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

    proc mole(value: real): substance {
        return new substance(value, 1, 0, "mole");
    }

    proc millimole(value: real): substance {
        return new substance(value, 1000, 0, "millimole");
    }   

    operator +(lhs: substance, rhs: substance): substance {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new substance(lhs._value + rhs_val, lhs.coefficient, lhs.constant, lhs.substanceType);
    }

    operator -(lhs: substance, rhs: substance): substance {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new substance(lhs._value - rhs_val, lhs.coefficient, lhs.constant, lhs.substanceType);
    }

    operator *(lhs: real, inout rhs: substance): substance {
        rhs._value = rhs._value * lhs;
        return rhs;
    }

    operator ==(lhs: substance, rhs: substance): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }

    operator !=(lhs: substance, rhs: substance): bool {
        return !(lhs == rhs);
    }
}