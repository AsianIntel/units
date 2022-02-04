module Substance {
    private use unit;
    private use Unit_Registry;

    proc substance(unitObj: shared AbstractUnitObj, constant: real, value: real): unit {
        return new unit(0, 0, 0, 0, 0, 1, 0, unitObj.getCoefficient(), constant, value, unitObj.getSymbol());
    }

    proc substance(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(0, 0, 0, 0, 0, 1, 0, coefficient, constant, value, symbol);
    }
    
    // private use Derived_unit;
    // private use Length;
    // private use Mass;
    // private use Unit_time;
    // private use Electrical_current;
    // private use Temperature;
    // private use Luminous_intensity;

    // record substance {
    //     var dims: unit;
    //     var _value: real;
    //     var coefficient: real;
    //     var constant: real;        
        
    //     proc init(value: real, coefficient: real, constant: real) {  
    //         this.dims = new unit(0, 0, 0, 0, 0, 1, 0);          
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

    // proc mole(value: real): substance {
    //     return new substance(value, 1, 0);
    // }

    // proc millimole(value: real): substance {
    //     return new substance(value, 1000, 0);
    // }   

    // operator +(lhs: substance, rhs: substance): substance {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new substance(lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator -(lhs: substance, rhs: substance): substance {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new substance(lhs._value - rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator *(lhs: real, inout rhs: substance): substance {
    //     rhs._value = rhs._value * lhs;
    //     return rhs;
    // }

    // operator *(lhs: substance, rhs: length): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: substance, rhs: mass): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: substance, rhs: time): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: substance, rhs: electrical_current): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: substance, rhs: temperature): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: substance, rhs: substance): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: substance, rhs: luminous_intensity): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator /(lhs: substance, rhs: length): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: substance, rhs: mass): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: substance, rhs: time): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: substance, rhs: electrical_current): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: substance, rhs: temperature): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: substance, rhs: substance): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: substance, rhs: luminous_intensity): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator ==(lhs: substance, rhs: substance): bool {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return lhs._value == rhs_val;
    // }

    // operator !=(lhs: substance, rhs: substance): bool {
    //     return !(lhs == rhs);
    // }
}