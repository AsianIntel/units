module derived_unit {
    private use unit;

    class derived_unit: unit {
        var _value: real;
        var coefficient: real;
        var constant: real;

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

    operator +(lhs: borrowed derived_unit, rhs: borrowed derived_unit): owned derived_unit where lhs.dims(rhs) {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new derived_unit(lhs.length, lhs.mass, lhs.time, lhs.electric_current, lhs.temperature, lhs.substance, lhs.luminous_intensity, lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    }

    operator -(lhs: borrowed derived_unit, rhs: borrowed derived_unit): owned derived_unit where lhs.dims(rhs) {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new derived_unit(lhs.length, lhs.mass, lhs.time, lhs.electric_current, lhs.temperature, lhs.substance, lhs.luminous_intensity, lhs._value - rhs_val, lhs.coefficient, lhs.constant);
    }

    operator *(lhs: real, rhs: borrowed derived_unit): derived_unit {
        rhs._value = rhs._value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed derived_unit, rhs: borrowed derived_unit): bool where lhs.dims(rhs) {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }

    operator !=(lhs: borrowed derived_unit, rhs: borrowed derived_unit): bool where lhs.dims(rhs) {
        return !(lhs == rhs);
    }
}