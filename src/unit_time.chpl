module unit_time {
    private use unit;

    record time {
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

    // class second: time {
    //     proc init(value: real) {
    //         super.init(value, 1, 0);
    //     }
    // }

    // class minute: time {
    //     proc init(value: real) {
    //         super.init(value, 0.0166666667, 0);
    //     }
    // }

    // operator +(lhs: borrowed time, rhs: borrowed time): owned time {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new time(lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator *(lhs: real, rhs: borrowed time): time {
    //     rhs._value = rhs._value * lhs;
    //     return rhs;
    // }

    // operator ==(lhs: borrowed time, rhs: borrowed time): bool {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return lhs._value == rhs_val;
    // }

    // operator !=(lhs: borrowed time, rhs: borrowed time): bool {
    //     return !(lhs == rhs);
    // }
}