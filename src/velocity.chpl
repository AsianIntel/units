module velocity {
    private use unit;

    class velocity: unit {
        var value: real;
        var coefficient: real;
        var constant: real;

        proc init(value: real, coefficient: real, constant: real) {
            super.init(1, 0, -1, 0, 0, 0, 0);
            this.value = value;
            this.coefficient = coefficient;
            this.constant = constant;
        }
    }
}