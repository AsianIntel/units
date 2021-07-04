module substance {
    private use unit;

    class substance: unit {
        var _value: real;
        var coefficient: real;
        var constant: real;
        
        proc init(value: real, coefficient: real, constant: real) {
            super.init(0, 0, 0, 0, 0, 1, 0);
            this._value = value;
            this.coefficient = coefficient;
            this.constant = constant;
        }

        override proc value(): real {
            return _value;
        }

        override proc from_base(val: real): real {
            return coefficient * val + constant;
        }

        override proc to_base(): real {
            return (_value - constant) / coefficient;
        }
    }

    class mole: substance {
        proc init(value: real) {
            super.init(value, 1, 0);
        }
    }

    class millimole: substance {
        proc init(value: real) {
            super.init(value, 1000, 0);
        }
    }

    operator +(lhs: borrowed substance, rhs: borrowed substance): owned substance {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new substance(lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    }

    operator -(lhs: borrowed substance, rhs: borrowed substance): owned substance {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new substance(lhs._value - rhs_val, lhs.coefficient, lhs.constant);
    }

    operator *(lhs: real, rhs: borrowed substance): substance {
        rhs._value = rhs._value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed substance, rhs: borrowed substance): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }

    operator !=(lhs: borrowed substance, rhs: borrowed substance): bool {
        return !(lhs == rhs);
    }
}