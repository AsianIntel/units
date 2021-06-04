module unit {
    private use IO;

    class unit {
        param length: int;
        param mass: int;
        param time: int;
        param electric_current: int;
        param temperature: int;
        param substance: int;
        param luminosity: int;

        proc to_base(): real {
            halt("Virtual method");
        }

        proc dims(other: borrowed unit) param {
            return (
                this.length == other.length &&
                this.mass == other.mass &&
                this.time == other.time &&
                this.electric_current == other.electric_current &&
                this.temperature == other.temperature &&
                this.substance == other.substance &&
                this.luminosity == other.luminosity
            );
        }
    }

    operator +(lhs: borrowed unit, rhs: borrowed unit): owned unit {
        compilerError("This type of operation is not possible");
    }
}