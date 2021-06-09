module velocity {
    private use unit;

    class velocity: unit {
        var value: real;
        var coefficient: real;
        var constant: real;

        proc init(value: real, coefficient: real, constant: real) {
            super.init(1, 0, -1, 0, 0, 0, 0);
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

    class meter_per_second: velocity {
        proc init(value: real) {
            super.init(value, 1, 0);
        }
    }

    operator +(lhs: borrowed velocity, rhs: borrowed velocity): owned velocity {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new velocity(lhs.value + rhs_val, lhs.coefficient, lhs.constant);
    }

    operator -(lhs: borrowed velocity, rhs: borrowed velocity): owned velocity {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new velocity(lhs.value - rhs_val, lhs.coefficient, lhs.constant);
    }

    operator ==(lhs: borrowed velocity, rhs: borrowed velocity): bool {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs.value == rhs_val;
    }
}