module Electrical_current {
    private use unit;

    proc electrical_current(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(0, 0, 0, 1, 0, 0, 0, coefficient, constant, value, symbol);
    }

    // private use Derived_unit;
    // private use Length;
    // private use Mass;
    // private use Unit_time;    
    // private use Temperature;
    // private use Substance;
    // private use Luminous_intensity; 

    // record electrical_current {
    //     var dims: unit;
    //     var _value: real;
    //     var coefficient: real;
    //     var constant: real;        
        
    //     proc init(value: real, coefficient: real, constant: real) {  
    //         this.dims = new unit(0, 0, 0, 1, 0, 0, 0);          
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

    // proc ampere(value: real): electrical_current {
    //     return new electrical_current(value, 1, 0);
    // }

    // proc kiloampere(value: real): electrical_current {
    //     return new electrical_current(value, 0.001, 0);
    // }
    
    // operator +(lhs: electrical_current, rhs: electrical_current): electrical_current {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new electrical_current(lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator -(lhs: electrical_current, rhs: electrical_current): electrical_current {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new electrical_current(lhs._value - rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator *(lhs: real, inout rhs: electrical_current): electrical_current {
    //     rhs._value = rhs._value * lhs;
    //     return rhs;
    // }

    // operator *(lhs: electrical_current, rhs: length): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: electrical_current, rhs: mass): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: electrical_current, rhs: time): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: electrical_current, rhs: electrical_current): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: electrical_current, rhs: temperature): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: electrical_current, rhs: substance): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: electrical_current, rhs: luminous_intensity): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator /(lhs: electrical_current, rhs: length): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: electrical_current, rhs: mass): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: electrical_current, rhs: time): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: electrical_current, rhs: electrical_current): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: electrical_current, rhs: temperature): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: electrical_current, rhs: substance): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: electrical_current, rhs: luminous_intensity): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator ==(lhs: electrical_current, rhs: electrical_current): bool {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return lhs._value == rhs_val;
    // }

    // operator !=(lhs: electrical_current, rhs: electrical_current): bool {
    //     return !(lhs == rhs);
    // }
}