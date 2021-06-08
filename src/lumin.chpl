module lumin {
    private use unit;

    class lumin: unit {
        var value: real;
        var to_base_func: func(real, real);
        var to_self_func: func(real, real);
        
        proc init(value: real, to_base_func, to_self_func) {
            super.init(0, 0, 0, 0, 0, 0, 1);
            this.value = value;
            this.to_base_func = to_base_func;
            this.to_self_func = to_self_func;
        }

        proc to_base(): real {
            return this.to_base_func(value);
        }
    }

    class candela: lumin {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x * 1; }, lambda(x: real) { return x * 1; });
        }
    }
    
    operator +(lhs: borrowed lumin, rhs: borrowed lumin): owned lumin {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new lumin(lhs.value + rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator -(lhs: borrowed lumin, rhs: borrowed lumin): owned lumin {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new lumin(lhs.value - rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator *(lhs: real, rhs: borrowed lumin): lumin {
        rhs.value = rhs.value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed lumin, rhs: borrowed lumin): bool {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return lhs.value == rhs_val;
    }

    operator !=(lhs: borrowed lumin, rhs: borrowed lumin): bool {
        return !(lhs == rhs);
    }
}