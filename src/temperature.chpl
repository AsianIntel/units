module Temperature {
    private use unit;

    proc temperature(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(0, 0, 0, 0, 1, 0, 0, coefficient, constant, value, symbol);
    }

    // private use Derived_unit;
    // private use Length;
    // private use Mass;
    // private use Unit_time;
    // private use Electrical_current;
    // private use Substance;
    // private use Luminous_intensity;

    // record temperature {
    //     var dims: unit;
    //     var _value: real;
    //     var coefficient: real;
    //     var constant: real;        
        
    //     proc init(value: real, coefficient: real, constant: real) {  
    //         this.dims = new unit(0, 0, 0, 0, 1, 0, 0);          
    //         this._value = value;
    //         this.coefficient = coefficient;
    //         this.constant = constant;            
    //     }

    //     proc value(): real {
    //         return _value;
    //     }

    //     proc getCoefficient(): real {
    //         return coefficient;
    //     }

    //     proc getConstant(): real {
    //         return constant;
    //     }

    //     proc from_base(val: real): real {
    //         return coefficient * val + constant;
    //     }

    //     proc to_base(): real {
    //         return (_value - constant) / coefficient;
    //     }
    // }

    // proc kelvin(value: real): temperature {
    //     return new temperature(value, 1, 0);
    // }

    // proc celsius(value: real): temperature {
    //     return new temperature(value, 1, -273.15);
    // }

    // proc fahrenheit(value: real): temperature {
    //     return new temperature(value, 9.0/5.0, -459.67);

    // }  

    // operator +(lhs: temperature, rhs: temperature): temperature {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new temperature(lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator *(lhs: real, inout rhs: temperature): temperature {
    //     rhs._value = rhs._value * lhs;
    //     return rhs;
    // }

    // operator *(lhs: temperature, rhs: length): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: temperature, rhs: mass): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: temperature, rhs: time): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: temperature, rhs: electrical_current): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: temperature, rhs: temperature): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: temperature, rhs: substance): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: temperature, rhs: luminous_intensity): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator /(lhs: temperature, rhs: length): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: temperature, rhs: mass): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: temperature, rhs: time): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: temperature, rhs: electrical_current): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: temperature, rhs: temperature): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: temperature, rhs: substance): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: temperature, rhs: luminous_intensity): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator ==(lhs: temperature, rhs: temperature): bool {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return lhs._value == rhs_val;
    // }

    // operator !=(lhs: temperature, rhs: temperature): bool {
    //     return !(lhs == rhs);
    // }
}