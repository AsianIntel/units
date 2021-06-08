module length {
    private use unit;
    private use unit_time;
    private use velocity;

    class length: unit {
        var value: real;
        var coefficient: real;
        var constant: real;
        
        proc init(value: real, coefficient: real, constant: real) {
            super.init(1, 0, 0, 0, 0, 0, 0);
            this.value = value;
            this.coefficient = coefficient;
            this.constant = constant;
        }

        proc from_base(val: real): real {
            return coefficient * val + constant;
        }

        proc to_base(): real {
            return (value - constant) / coefficient;
        }
    }

    class meter: length {
        proc init(value: real) {
            super.init(value, 1, 0);
        }
    }

    class centimetre: length {
        proc init(value: real) {
            super.init(value, 100, 0);
        }
    }

    operator +(lhs: borrowed length, rhs: borrowed length): owned length {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new length(lhs.value + rhs_val, lhs.coefficient, lhs.constant);
    }

    operator -(lhs: borrowed length, rhs: borrowed length): owned length {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new length(lhs.value - rhs_val, lhs.coefficient, lhs.constant);
    }

    operator *(lhs: real, rhs: borrowed length): length {
        rhs.value = rhs.value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed length, rhs: borrowed length): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs.value == rhs_val;
    }

    operator !=(lhs: borrowed length, rhs: borrowed length): bool {
        return !(lhs == rhs);
    }

    operator /(lhs: borrowed length, rhs: borrowed time): owned velocity {
        return new velocity(lhs.value / rhs.value, lhs.coefficient / rhs.coefficient, 0);
    }
}