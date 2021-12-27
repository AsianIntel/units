module electrical_current {
    private use unit;

    record electrical_current {
        var _value: real;
        var coefficient: real;
        var constant: real;
        
        proc init(value: real, coefficient: real, constant: real) {
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

    // class kiloampere: electrical_current {
    //     proc init(value: real) {
    //         super.init(value, 0.001, 0);
    //     }
    // }

    // class ampere: electrical_current {
    //     proc init(value: real) {
    //         super.init(value, 1, 0);
    //     }
    // }

    // operator +(lhs: borrowed electrical_current, rhs: borrowed electrical_current): owned electrical_current {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new electrical_current(lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator -(lhs: borrowed electrical_current, rhs: borrowed electrical_current): owned electrical_current {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new electrical_current(lhs._value - rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator *(lhs: real, rhs: borrowed electrical_current): electrical_current {
    //     rhs._value = rhs._value * lhs;
    //     return rhs;
    // }

    // operator ==(lhs: borrowed electrical_current, rhs: borrowed electrical_current): bool {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return lhs._value == rhs_val;
    // }

    // operator !=(lhs: borrowed electrical_current, rhs: borrowed electrical_current): bool {
    //     return !(lhs == rhs);
    // }
}