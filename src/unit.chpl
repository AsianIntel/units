module unit {
    private use IO;

    record unit {
        var length: int;
        var mass: int;
        var time: int;
        var electric_current: int;
        var temperature: int;
        var substance: int;
        var luminous_intensity: int;

        proc init(Length: int, Mass: int, Time: int, ElectricCurrent: int, Temperature: int, Substance: int, LuminousIntensity: int) {
            this.length = Length;
            this.mass = Mass;
            this.time = Time;
            this.electric_current = ElectricCurrent;
            this.temperature = Temperature;
            this.substance = Substance;
            this.luminous_intensity = LuminousIntensity;
        }

        proc checkDims(other: unit) param {
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
    }

    operator +(lhs: unit, rhs: unit): unit {
        return new unit(
            lhs.length + rhs.length,
            lhs.mass + rhs.mass,
            lhs.time + rhs.time,
            lhs.electric_current + rhs.electric_current,
            lhs.temperature + rhs.temperature,
            lhs.substance + rhs.substance,
            lhs.luminous_intensity + rhs.luminous_intensity);
    }

    operator -(lhs: unit, rhs: unit): unit {
        return new unit(
            lhs.length - rhs.length,
            lhs.mass - rhs.mass,
            lhs.time - rhs.time,
            lhs.electric_current - rhs.electric_current,
            lhs.temperature - rhs.temperature,
            lhs.substance - rhs.substance,
            lhs.luminous_intensity - rhs.luminous_intensity);
    }
}