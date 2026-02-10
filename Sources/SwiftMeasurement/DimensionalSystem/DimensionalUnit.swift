import Foundation

/// Protocol for unit types that have defined dimensions
public protocol DimensionalUnit {
    /// The dimensional exponents of the unit
    static var dimensions: DimensionalExponents { get }
}

// MARK: - Length-Based Units

// Length - [L]
extension UnitLength: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: 1)
    }
}

// Area - [L²]
extension UnitArea: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: 2)
    }
}

// Volume - [L³]
extension UnitVolume: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: 3)
    }
}

// Speed - [L·T⁻¹]
extension UnitSpeed: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: 1, time: -1)
    }
}

// Acceleration - [L·T⁻²]
extension UnitAcceleration: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: 1, time: -2)
    }
}

// MARK: - Time-Based Units

// Duration - [T]
extension UnitDuration: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(time: 1)
    }
}

// Frequency - [T⁻¹]
extension UnitFrequency: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(time: -1)
    }
}

// MARK: - Mass-Based Units

// Mass - [M]
extension UnitMass: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(mass: 1)
    }
}

// Concentration Mass - [M·L⁻³]
extension UnitConcentrationMass: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: -3, mass: 1)
    }
}

// MARK: - Energy and Power

// Energy - [M·L²·T⁻²]
extension UnitEnergy: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: 2, time: -2, mass: 1)
    }
}

// Power - [M·L²·T⁻³]
extension UnitPower: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: 2, time: -3, mass: 1)
    }
}

// Pressure - [M·L⁻¹·T⁻²]
extension UnitPressure: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: -1, time: -2, mass: 1)
    }
}

// MARK: - Electrical Units

// Electric Current - [I]
extension UnitElectricCurrent: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(current: 1)
    }
}

// Electric Charge - [I·T]
extension UnitElectricCharge: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(time: 1, current: 1)
    }
}

// Electric Potential Difference - [M·L²·T⁻³·I⁻¹]
extension UnitElectricPotentialDifference: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: 2, time: -3, mass: 1, current: -1)
    }
}

// Electric Resistance - [M·L²·T⁻³·I⁻²]
extension UnitElectricResistance: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: 2, time: -3, mass: 1, current: -2)
    }
}

// MARK: - Other SI Base Units

// Temperature - [Θ]
extension UnitTemperature: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(temperature: 1)
    }
}

// Illuminance - [L⁻²·J]
extension UnitIlluminance: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: -2, luminosity: 1)
    }
}

// MARK: - Dimensionless and Special Units

// Angle - [dimensionless]
extension UnitAngle: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents()
    }
}

// Information Storage - [dimensionless]
extension UnitInformationStorage: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents()
    }
}

// Dispersion - [dimensionless]
extension UnitDispersion: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents()
    }
}

// Fuel Efficiency - [L⁻²]
extension UnitFuelEfficiency: DimensionalUnit {
    public static var dimensions: DimensionalExponents {
        return DimensionalExponents(length: -2)
    }
}
