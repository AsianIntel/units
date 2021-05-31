module temperature {
    private use unit;

    class temperature: unit {
        var value: real;
        var to_base_func: func(real, real);
        var to_self_func: func(real, real);
        
        proc init(value: real, to_base_func, to_self_func) {
            super.init(0, 0, 0, 0, 1, 0, 0);
            this.value = value;
            this.to_base_func = to_base_func;
            this.to_self_func = to_self_func;
        }

        override proc to_base(): real {
            return this.to_base_func(value);
        }
    }

    class kelvin: temperature {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x * 1; }, lambda(x: real) { return x * 1; });
        }
    }

    class celsius: temperature {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return x + 273.15; }, lambda(x: real) { return x - 273.15; });
        }
    }

    class fahrenheit: temperature {
        proc init(value: real) {
            super.init(value, lambda(x: real) { return (5.0 * (x + 459.67)) / 9.0; }, lambda(x: real) { return (9.0 * x / 5.0) - 459.67; });
        }   
    }

    operator +(lhs: borrowed temperature, rhs: borrowed temperature): owned temperature {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return new temperature(lhs.value + rhs_val, lhs.to_base_func, lhs.to_self_func);
    }

    operator *(lhs: real, rhs: borrowed temperature): temperature {
        rhs.value = rhs.value * lhs;
        return rhs;
    }

    operator ==(lhs: borrowed temperature, rhs: borrowed temperature): bool {
        var rhs_val = lhs.to_self_func(rhs.to_base());
        return lhs.value == rhs_val;
    }

    operator !=(lhs: borrowed temperature, rhs: borrowed temperature): bool {
        return !(lhs == rhs);
    }
}