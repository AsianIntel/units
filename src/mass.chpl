module mass {
    private use unit;

    class mass: unit {
        var value: real;
        var coefficient: real;
        var constant: real;
        
        proc init(value: real, coefficient: real, constant: real) {
            super.init(0, 1, 0, 0, 0, 0, 0);
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

    class kilogram: mass {
        proc init(value: real) {
            super.init(value, 0.001, 0);
        }
    }

    class gram: mass {
        proc init(value: real) {
            super.init(value, 1, 0);
        }
    }

    operator +(lhs: borrowed mass, rhs: borrowed mass): owned mass {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new mass(lhs.value + rhs_val, lhs.coefficient, lhs.constant);
    }

    operator -(lhs: borrowed mass, rhs: borrowed mass): owned mass {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new mass(lhs.value - rhs_val, lhs.coefficient, lhs.constant);
    }

    operator *(lhs: real, rhs: borrowed mass): mass {
        rhs.value = rhs.value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed mass, rhs: borrowed mass): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs.value == rhs_val;
    }

    operator !=(lhs: borrowed mass, rhs: borrowed mass): bool {
        return !(lhs == rhs);
    }
}