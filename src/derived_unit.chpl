module derived_unit {
    private use unit;

    record derived_unit {
        var dims: unit;
        var _value: real;
        var coefficient: real;
        var constant: real;        

        proc init(dims: unit, value: real, coefficient: real, constant: real) {
            this.dims = dims;
            this._value = value;
            this.coefficient = coefficient;
            this.constant = constant;                       
        }

        proc value(): real {
            return _value;
        }

        proc getCoefficient(): real {
            return coefficient;
        }

        proc getConstant(): real {
            return constant;
        }

        proc from_base(val: real): real {
            return coefficient * val + constant;
        }

        proc to_base(): real {
            return (_value - constant) / coefficient;
        }        
    }

    operator +(lhs: derived_unit, rhs: derived_unit): derived_unit where lhs.dims.checkDims(rhs.dims) {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new derived_unit(lhs.dims, lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    }

    operator -(lhs: derived_unit, rhs: derived_unit): derived_unit where lhs.dims.checkDims(rhs.dims) {
        var rhs_val = lhs.from_base(rhs.to_base());
        return new derived_unit(lhs.dims, lhs._value - rhs_val, lhs.coefficient, lhs.constant);
    }

    operator *(lhs: real, inout rhs: derived_unit): derived_unit {
        rhs._value = rhs._value * lhs;
        return rhs;
    }

    operator ==(lhs: derived_unit, rhs: derived_unit): bool where lhs.dims.checkDims(rhs.dims) {
        var rhs_val = lhs.from_base(rhs.to_base());
        return lhs._value == rhs_val;
    }

    operator !=(lhs: derived_unit, rhs: derived_unit): bool where lhs.dims.checkDims(rhs.dims) {
        return !(lhs == rhs);
    }
    

    // operator +(lhs: borrowed derived_unit, rhs: borrowed derived_unit): owned derived_unit where lhs.dims(rhs) {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new derived_unit(lhs.length, lhs.mass, lhs.time, lhs.electric_current, lhs.temperature, lhs.substance, lhs.luminous_intensity, lhs._value + rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator +(lhs: borrowed unit, rhs: borrowed derived_unit): owned derived_unit where lhs.dims(rhs) {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new derived_unit(lhs.length, lhs.mass, lhs.time, lhs.electric_current, lhs.temperature, lhs.substance, lhs.luminous_intensity, lhs.value() + rhs_val, lhs.getCoefficient(), lhs.getConstant());
    // }   

    // operator -(lhs: borrowed derived_unit, rhs: borrowed derived_unit): owned derived_unit where lhs.dims(rhs) {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new derived_unit(lhs.length, lhs.mass, lhs.time, lhs.electric_current, lhs.temperature, lhs.substance, lhs.luminous_intensity, lhs._value - rhs_val, lhs.coefficient, lhs.constant);
    // }

    // operator -(lhs: borrowed unit, rhs: borrowed derived_unit): owned derived_unit where lhs.dims(rhs) {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return new derived_unit(lhs.length, lhs.mass, lhs.time, lhs.electric_current, lhs.temperature, lhs.substance, lhs.luminous_intensity, lhs.value() - rhs_val, lhs.getCoefficient(), lhs.getConstant());
    // }    

    // operator *(lhs: real, rhs: borrowed derived_unit): derived_unit {
    //     rhs._value = rhs._value * lhs;
    //     return rhs;
    // }

    // operator ==(lhs: borrowed derived_unit, rhs: borrowed derived_unit): bool where lhs.dims(rhs) {
    //     var rhs_val = lhs.from_base(rhs.to_base());
    //     return lhs._value == rhs_val;
    // }

    // operator !=(lhs: borrowed derived_unit, rhs: borrowed derived_unit): bool where lhs.dims(rhs) {
    //     return !(lhs == rhs);
    // }

    // operator *(lhs: borrowed unit, rhs: borrowed unit): owned derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(
    //         lhs.length + rhs.length, 
    //         lhs.mass + rhs.mass, 
    //         lhs.time + rhs.time, 
    //         lhs.electric_current + rhs.electric_current, 
    //         lhs.temperature + rhs.temperature, 
    //         lhs.substance + rhs.substance, 
    //         lhs.luminous_intensity + rhs.luminous_intensity, 
    //         lhs_val * rhs_val, 
    //         1, 
    //         0
    //     );
    // }

    // operator /(lhs: borrowed unit, rhs: borrowed unit): owned derived_unit {
    //     var lhs_val = lhs.to_base();
    //     var rhs_val = rhs.to_base();

    //     return new derived_unit(
    //         lhs.length - rhs.length, 
    //         lhs.mass - rhs.mass, 
    //         lhs.time - rhs.time, 
    //         lhs.electric_current - rhs.electric_current, 
    //         lhs.temperature - rhs.temperature, 
    //         lhs.substance - rhs.substance, 
    //         lhs.luminous_intensity - rhs.luminous_intensity, 
    //         lhs_val / rhs_val, 
    //         1, 
    //         0
    //     );
    // }
}