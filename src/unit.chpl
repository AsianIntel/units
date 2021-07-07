module unit {
    private use IO;

    class unit {
        param length: int;
        param mass: int;
        param time: int;
        param electric_current: int;
        param temperature: int;
        param substance: int;
        param luminous_intensity: int;

        proc dims(other: borrowed unit) param {
            return (
                this.length == other.length &&
                this.mass == other.mass &&
                this.time == other.time &&
                this.electric_current == other.electric_current &&
                this.temperature == other.temperature &&
                this.substance == other.substance &&
                this.luminous_intensity == other.luminous_intensity
            );
        }
        

        proc value(): real { halt("Virtual class method"); }
        proc from_base(val: real): real { halt("Virtual class method"); }
        proc to_base(): real { halt("Virtual class method"); }                
    }
}