module length {
    private use unit;

    class length: unit {
        var value: real;
        var to_base_func: func(real, real);
        var to_self_func: func(real, real);
        
        proc init(value: real, to_base_func, to_self_func) {
            super.init(1, 0, 0, 0, 0, 0, 0);
            this.value = value;
            this.to_base_func = to_base_func;
            this.to_self_func = to_self_func;
        }

        override proc to_base(): real {
            return this.to_base_func(value);
        }
    }

    class meter: length {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x * 1; }, lambda(x: real) { return x * 1; });
        }
    }

    class centimetre: length {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x * 0.01; }, lambda(x: real) { return x * 100; });
        }
    }

    operator +(lhs: borrowed length, rhs: borrowed length): owned length {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new length(lhs.value + rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator *(lhs: real, rhs: borrowed length): length {
        rhs.value = rhs.value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed length, rhs: borrowed length): bool {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return lhs.value == rhs_val;
    }

    operator !=(lhs: borrowed length, rhs: borrowed length): bool {
        return !(lhs == rhs);
    }
}