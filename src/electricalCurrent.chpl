module electricalCurrent {
    private use unit;

    class electricalCurrent: unit {
        var value: real;
        var to_base_func: func(real, real);
        var to_self_func: func(real, real);
        
        proc init(value: real, to_base_func, to_self_func) {
            super.init(0, 0, 0, 1, 0, 0, 0);
            this.value = value;
            this.to_base_func = to_base_func;
            this.to_self_func = to_self_func;
        }

        proc to_base(): real {
            return this.to_base_func(value);
        }
    }

    class kiloampere: electricalCurrent {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x * 1000; }, lambda(x: real) { return x / 1000; });
        }
    }

    class ampere: electricalCurrent {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x; }, lambda(x: real) { return x; });
        }
    }

    operator +(lhs: borrowed electricalCurrent, rhs: borrowed electricalCurrent): owned electricalCurrent {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new electricalCurrent(lhs.value + rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator -(lhs: borrowed electricalCurrent, rhs: borrowed electricalCurrent): owned electricalCurrent {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new electricalCurrent(lhs.value - rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator *(lhs: real, rhs: borrowed electricalCurrent): electricalCurrent {
        rhs.value = rhs.value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed electricalCurrent, rhs: borrowed electricalCurrent): bool {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return lhs.value == rhs_val;
    }

    operator !=(lhs: borrowed electricalCurrent, rhs: borrowed electricalCurrent): bool {
        return !(lhs == rhs);
    }
}