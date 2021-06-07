module unit_time {
    private use unit;

    class time: unit {
        var value: real;
        var to_base_func: func(real, real);
        var to_self_func: func(real, real);
        
        proc init(value: real, to_base_func, to_self_func) {
            super.init(0, 0, 1, 0, 0, 0, 0);
            this.value = value;
            this.to_base_func = to_base_func;
            this.to_self_func = to_self_func;
        }

        proc to_base(): real {
            return this.to_base_func(value);
        }
    }

    class second: time {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x * 1; }, lambda(x: real) { return x * 1; });
        }
    }

    class minute: time {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x * 60; }, lambda(x: real) { return x / 60; });
        }
    }

    operator +(lhs: borrowed time, rhs: borrowed time): owned time {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new time(lhs.value + rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator *(lhs: real, rhs: borrowed time): time {
        rhs.value = rhs.value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed time, rhs: borrowed time): bool {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return lhs.value == rhs_val;
    }

    operator !=(lhs: borrowed time, rhs: borrowed time): bool {
        return !(lhs == rhs);
    }
}