module mass {
    private use unit;

    class mass: unit {
        var value: real;
        var to_base_func: func(real, real);
        var to_self_func: func(real, real);
        
        proc init(value: real, to_base_func, to_self_func) {
            super.init(0, 1, 0, 0, 0, 0, 0);
            this.value = value;
            this.to_base_func = to_base_func;
            this.to_self_func = to_self_func;
        }

        proc to_base(): real {
            return this.to_base_func(value);
        }
    }

    class kilogram: mass {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x * 1000; }, lambda(x: real) { return x / 1000; });
        }
    }

    class gram: mass {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x; }, lambda(x: real) { return x; });
        }
    }

    operator +(lhs: borrowed mass, rhs: borrowed mass): owned mass {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new mass(lhs.value + rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator -(lhs: borrowed mass, rhs: borrowed mass): owned mass {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new mass(lhs.value - rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator *(lhs: real, rhs: borrowed mass): mass {
        rhs.value = rhs.value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed mass, rhs: borrowed mass): bool {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return lhs.value == rhs_val;
    }

    operator !=(lhs: borrowed mass, rhs: borrowed mass): bool {
        return !(lhs == rhs);
    }
}