module Length {
    private use unit;
    private use Unit_Registry;

    proc length(unitObj: shared AbstractUnitObj, constant: real, value: real): unit {
        return new unit(1, 0, 0, 0, 0, 0, 0, unitObj.getCoefficient(), constant, value, unitObj.getSymbol());
    }
    
    proc length(coefficient: real, constant: real, value: real, symbol: string): unit {
        return new unit(1, 0, 0, 0, 0, 0, 0, coefficient, constant, value, symbol);
    }

    // private use Derived_unit;
    // private use Mass;
    // private use Unit_time;
    // private use Electrical_current;
    // private use Temperature;
    // private use Substance;
    // private use Luminous_intensity;    

    // record length {
    //     var dims: unit;
    //     var _value: real;
    //     var coefficient: real;
    //     var constant: real;
                
    //     proc init(value: real, coefficient: real, constant: real) {  
    //         this.dims = new unit(1, 0, 0, 0, 0, 0, 0);          
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

    // proc meter(value: real): length {
    //     return new length(value, 1, 0);
    // }

    // proc centimetre(value: real): length {
    //     return new length(value, 100, 0);
    // }   

    // operator +(lhs: length, rhs: length): length {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new length(lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator +(lhs: length, rhs: derived_unit): derived_unit where lhs.dims.checkDims(rhs.dims) {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new length(lhs.dims, lhs.value() + rhs_val, lhs.getCoefficient(), lhs.getConstant());
    // }

    // operator -(lhs: length, rhs: length): length {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new length(lhs._value - rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator *(lhs: real, inout rhs: length): length {
    //     rhs._value = rhs._value * lhs;
    //     return rhs;
    // }   

    // operator *(lhs: length, rhs: length): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: length, rhs: mass): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: length, rhs: time): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: length, rhs: electrical_current): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: length, rhs: temperature): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: length, rhs: substance): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator *(lhs: length, rhs: luminous_intensity): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims + rhs.dims, lhs_val * rhs_val, 1, 0);
    // }

    // operator /(lhs: length, rhs: length): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: length, rhs: mass): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: length, rhs: time): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: length, rhs: electrical_current): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: length, rhs: temperature): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: length, rhs: substance): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator /(lhs: length, rhs: luminous_intensity): derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(lhs.dims - rhs.dims, lhs_val / rhs_val, 1, 0);
    // }

    // operator ==(lhs: length, rhs: length): bool {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return lhs._value == rhs_val;
    // }

    // operator !=(lhs: length, rhs: length): bool {
    //     return !(lhs == rhs);
    // }    
}