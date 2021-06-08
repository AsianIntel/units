module substance {
    private use unit;

    class substance: unit {
        var value: real;
        var to_base_func: func(real, real);
        var to_self_func: func(real, real);
        
        proc init(value: real, to_base_func, to_self_func) {
            super.init(0, 0, 0, 0, 0, 1, 0);
            this.value = value;
            this.to_base_func = to_base_func;
            this.to_self_func = to_self_func;
        }

        proc to_base(): real {
            return this.to_base_func(value);
        }
    }

    class mole: substance {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x * 1; }, lambda(x: real) { return x * 1; });
        }
    }

    class millimole: substance {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x * 0.001; }, lambda(x: real) { return x * 1000; });
        }
    }

    operator +(lhs: borrowed substance, rhs: borrowed substance): owned substance {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new substance(lhs.value + rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator -(lhs: borrowed substance, rhs: borrowed substance): owned substance {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new substance(lhs.value - rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator *(lhs: real, rhs: borrowed substance): substance {
        rhs.value = rhs.value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed substance, rhs: borrowed substance): bool {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return lhs.value == rhs_val;
    }

    operator !=(lhs: borrowed substance, rhs: borrowed substance): bool {
        return !(lhs == rhs);
    }
}