/**
 *  SwiftMeasurement
 *
 *  Copyright (c) 2017 Ken Tominaga. Licensed under the MIT license, as follows:
 *
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *
 *  The above copyright notice and this permission notice shall be included in all
 *  copies or substantial portions of the Software.
 *
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 *  SOFTWARE.
 */

import Foundation

// - UnitAngle: []
@available(iOS 10.0, *)
public extension Double {

    public var degrees: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .degrees)
    }

    public var arcMinutes: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .arcMinutes)
    }

    public var arcSeconds: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .arcSeconds)
    }

    public var radians: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .radians)
    }

    public var gradians: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .gradians)
    }

    public var revolutions: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .revolutions)
    }

}

// - UnitPressure: [M/LT^2]
@available(iOS 10.0, *)
public extension Double {

    public var newtonsPerMetersSquared: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .newtonsPerMetersSquared)
    }

    public var gigapascals: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .gigapascals)
    }

    public var megapascals: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .megapascals)
    }

    public var kilopascals: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .kilopascals)
    }

    public var hectopascals: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .hectopascals)
    }

    public var inchesOfMercury: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .inchesOfMercury)
    }

    public var bars: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .bars)
    }

    public var millibars: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .millibars)
    }

    public var millimetersOfMercury: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .millimetersOfMercury)
    }

    public var poundsForcePerSquareInch: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .poundsForcePerSquareInch)
    }

}

// - UnitDispersion: []
@available(iOS 10.0, *)
public extension Double {

    public var partsPerMillion: Measurement<UnitDispersion> {
        return Measurement(value: self, unit: .partsPerMillion)
    }

}

// - UnitElectricPotentialDifference: [L^2M/T^3I]
@available(iOS 10.0, *)
public extension Double {

    public var megavolts: Measurement<UnitElectricPotentialDifference> {
        return Measurement(value: self, unit: .megavolts)
    }

    public var kilovolts: Measurement<UnitElectricPotentialDifference> {
        return Measurement(value: self, unit: .kilovolts)
    }

    public var volts: Measurement<UnitElectricPotentialDifference> {
        return Measurement(value: self, unit: .volts)
    }

    public var millivolts: Measurement<UnitElectricPotentialDifference> {
        return Measurement(value: self, unit: .millivolts)
    }

    public var microvolts: Measurement<UnitElectricPotentialDifference> {
        return Measurement(value: self, unit: .microvolts)
    }

}

// - UnitDuration: [T]
@available(iOS 10.0, *)
public extension Double {

    public var seconds: Measurement<UnitDuration> {
        return Measurement(value: self, unit: .seconds)
    }

    public var minutes: Measurement<UnitDuration> {
        return Measurement(value: self, unit: .minutes)
    }

    public var hours: Measurement<UnitDuration> {
        return Measurement(value: self, unit: .hours)
    }

}

// - UnitPower: [ML^2/T^3]
@available(iOS 10.0, *)
public extension Double {

    public var terawatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .terawatts)
    }

    public var gigawatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .gigawatts)
    }

    public var megawatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .megawatts)
    }

    public var kilowatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .kilowatts)
    }

    public var watts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .watts)
    }

    public var milliwatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .milliwatts)
    }

    public var microwatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .microwatts)
    }

    public var nanowatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .nanowatts)
    }

    public var picowatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .picowatts)
    }

    public var femtowatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .femtowatts)
    }

    public var horsepower: Measurement<UnitPower> {
        return Measurement(value: self, unit: .horsepower)
    }

}

// - UnitElectricCharge: [IT]
@available(iOS 10.0, *)
public extension Double {

    public var coulombs: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .coulombs)
    }

    public var megaampereHours: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .megaampereHours)
    }

    public var kiloampereHours: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .kiloampereHours)
    }

    public var ampereHours: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .ampereHours)
    }

    public var milliampereHours: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .milliampereHours)
    }

    public var microampereHours: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .microampereHours)
    }

}

// - UnitAcceleration: [L/T^2]
@available(iOS 10.0, *)
public extension Double {

    public var metersPerSecondSquared: Measurement<UnitAcceleration> {
        return Measurement(value: self, unit: .metersPerSecondSquared)
    }

    public var gravity: Measurement<UnitAcceleration> {
        return Measurement(value: self, unit: .gravity)
    }

}

// - UnitTemperature: [Θ]
@available(iOS 10.0, *)
public extension Double {

    public var kelvin: Measurement<UnitTemperature> {
        return Measurement(value: self, unit: .kelvin)
    }

    public var celsius: Measurement<UnitTemperature> {
        return Measurement(value: self, unit: .celsius)
    }

    public var fahrenheit: Measurement<UnitTemperature> {
        return Measurement(value: self, unit: .fahrenheit)
    }

}

// - UnitIlluminance: [J/L^2]
@available(iOS 10.0, *)
public extension Double {

    public var lux: Measurement<UnitIlluminance> {
        return Measurement(value: self, unit: .lux)
    }

}

// - UnitFrequency: [/T]
@available(iOS 10.0, *)
public extension Double {

    public var terahertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .terahertz)
    }

    public var gigahertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .gigahertz)
    }

    public var megahertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .megahertz)
    }

    public var kilohertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .kilohertz)
    }

    public var hertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .hertz)
    }

    public var millihertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .millihertz)
    }

    public var microhertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .microhertz)
    }

    public var nanohertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .nanohertz)
    }

}

// - UnitArea: [L^2]
@available(iOS 10.0, *)
public extension Double {

    public var squareMegameters: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareMegameters)
    }

    public var squareKilometers: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareKilometers)
    }

    public var squareMeters: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareMeters)
    }

    public var squareCentimeters: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareCentimeters)
    }

    public var squareMillimeters: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareMillimeters)
    }

    public var squareMicrometers: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareMicrometers)
    }

    public var squareNanometers: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareNanometers)
    }

    public var squareInches: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareInches)
    }

    public var squareFeet: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareFeet)
    }

    public var squareYards: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareYards)
    }

    public var squareMiles: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareMiles)
    }

    public var acres: Measurement<UnitArea> {
        return Measurement(value: self, unit: .acres)
    }

    public var ares: Measurement<UnitArea> {
        return Measurement(value: self, unit: .ares)
    }

    public var hectares: Measurement<UnitArea> {
        return Measurement(value: self, unit: .hectares)
    }

}

// - UnitLength: [L]
@available(iOS 10.0, *)
public extension Double {

    public var megameters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .megameters)
    }

    public var kilometers: Measurement<UnitLength> {
        return Measurement(value: self, unit: .kilometers)
    }

    public var hectometers: Measurement<UnitLength> {
        return Measurement(value: self, unit: .hectometers)
    }

    public var decameters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .decameters)
    }

    public var meters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .meters)
    }

    public var decimeters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .decimeters)
    }

    public var centimeters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .centimeters)
    }

    public var millimeters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .millimeters)
    }

    public var micrometers: Measurement<UnitLength> {
        return Measurement(value: self, unit: .micrometers)
    }

    public var nanometers: Measurement<UnitLength> {
        return Measurement(value: self, unit: .nanometers)
    }

    public var picometers: Measurement<UnitLength> {
        return Measurement(value: self, unit: .picometers)
    }

    public var inches: Measurement<UnitLength> {
        return Measurement(value: self, unit: .inches)
    }

    public var feet: Measurement<UnitLength> {
        return Measurement(value: self, unit: .feet)
    }

    public var yards: Measurement<UnitLength> {
        return Measurement(value: self, unit: .yards)
    }

    public var miles: Measurement<UnitLength> {
        return Measurement(value: self, unit: .miles)
    }

    public var scandinavianMiles: Measurement<UnitLength> {
        return Measurement(value: self, unit: .scandinavianMiles)
    }

    public var lightyears: Measurement<UnitLength> {
        return Measurement(value: self, unit: .lightyears)
    }

    public var nauticalMiles: Measurement<UnitLength> {
        return Measurement(value: self, unit: .nauticalMiles)
    }

    public var fathoms: Measurement<UnitLength> {
        return Measurement(value: self, unit: .fathoms)
    }

    public var furlongs: Measurement<UnitLength> {
        return Measurement(value: self, unit: .furlongs)
    }

    public var astronomicalUnits: Measurement<UnitLength> {
        return Measurement(value: self, unit: .astronomicalUnits)
    }

    public var parsecs: Measurement<UnitLength> {
        return Measurement(value: self, unit: .parsecs)
    }

}

// - UnitElectricCurrent: [I]
@available(iOS 10.0, *)
public extension Double {

    public var megaamperes: Measurement<UnitElectricCurrent> {
        return Measurement(value: self, unit: .megaamperes)
    }

    public var kiloamperes: Measurement<UnitElectricCurrent> {
        return Measurement(value: self, unit: .kiloamperes)
    }

    public var amperes: Measurement<UnitElectricCurrent> {
        return Measurement(value: self, unit: .amperes)
    }

    public var milliamperes: Measurement<UnitElectricCurrent> {
        return Measurement(value: self, unit: .milliamperes)
    }

    public var microamperes: Measurement<UnitElectricCurrent> {
        return Measurement(value: self, unit: .microamperes)
    }

}

// - UnitFuelEfficiency
@available(iOS 10.0, *)
public extension Double {

    public var litersPer100Kilometers: Measurement<UnitFuelEfficiency> {
        return Measurement(value: self, unit: .litersPer100Kilometers)
    }

    public var milesPerImperialGallon: Measurement<UnitFuelEfficiency> {
        return Measurement(value: self, unit: .milesPerImperialGallon)
    }

    public var milesPerGallon: Measurement<UnitFuelEfficiency> {
        return Measurement(value: self, unit: .milesPerGallon)
    }

}

// - UnitConcentrationMass: [M/L^3]
@available(iOS 10.0, *)
public extension Double {

    public var gramsPerLiter: Measurement<UnitConcentrationMass> {
        return Measurement(value: self, unit: .gramsPerLiter)
    }

    public var milligramsPerDeciliter: Measurement<UnitConcentrationMass> {
        return Measurement(value: self, unit: .milligramsPerDeciliter)
    }

}

// - UnitVolume: [L^3]
@available(iOS 10.0, *)
public extension Double {

    public var megaliters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .megaliters)
    }

    public var kiloliters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .kiloliters)
    }

    public var liters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .liters)
    }

    public var deciliters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .deciliters)
    }

    public var centiliters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .centiliters)
    }

    public var milliliters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .milliliters)
    }

    public var cubicKilometers: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicKilometers)
    }

    public var cubicMeters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicMeters)
    }

    public var cubicDecimeters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicDecimeters)
    }

    public var cubicCentimeters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicCentimeters)
    }

    public var cubicMillimeters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicMillimeters)
    }

    public var cubicInches: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicInches)
    }

    public var cubicFeet: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicFeet)
    }

    public var cubicYards: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicYards)
    }

    public var cubicMiles: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicMiles)
    }

    public var acreFeet: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .acreFeet)
    }

    public var bushels: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .bushels)
    }

    public var teaspoons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .teaspoons)
    }

    public var tablespoons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .tablespoons)
    }

    public var fluidOunces: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .fluidOunces)
    }

    public var cups: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cups)
    }

    public var pints: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .pints)
    }

    public var quarts: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .quarts)
    }

    public var gallons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .gallons)
    }

    public var imperialTeaspoons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialTeaspoons)
    }

    public var imperialTablespoons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialTablespoons)
    }

    public var imperialFluidOunces: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialFluidOunces)
    }

    public var imperialPints: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialPints)
    }

    public var imperialQuarts: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialQuarts)
    }

    public var imperialGallons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialGallons)
    }

    public var metricCups: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .metricCups)
    }

}

// - UnitSpeed: [L/T]
@available(iOS 10.0, *)
public extension Double {

    public var metersPerSecond: Measurement<UnitSpeed> {
        return Measurement(value: self, unit: .metersPerSecond)
    }

    public var kilometersPerHour: Measurement<UnitSpeed> {
        return Measurement(value: self, unit: .kilometersPerHour)
    }

    public var milesPerHour: Measurement<UnitSpeed> {
        return Measurement(value: self, unit: .milesPerHour)
    }

    public var knots: Measurement<UnitSpeed> {
        return Measurement(value: self, unit: .knots)
    }

}

// - UnitElectricResistance: [L^2M/T^3I^2]
@available(iOS 10.0, *)
public extension Double {

    public var megaohms: Measurement<UnitElectricResistance> {
        return Measurement(value: self, unit: .megaohms)
    }

    public var kiloohms: Measurement<UnitElectricResistance> {
        return Measurement(value: self, unit: .kiloohms)
    }

    public var ohms: Measurement<UnitElectricResistance> {
        return Measurement(value: self, unit: .ohms)
    }

    public var milliohms: Measurement<UnitElectricResistance> {
        return Measurement(value: self, unit: .milliohms)
    }

    public var microohms: Measurement<UnitElectricResistance> {
        return Measurement(value: self, unit: .microohms)
    }

}

// - UnitMass: [M]
@available(iOS 10.0, *)
public extension Double {

    public var kilograms: Measurement<UnitMass> {
        return Measurement(value: self, unit: .kilograms)
    }

    public var grams: Measurement<UnitMass> {
        return Measurement(value: self, unit: .grams)
    }

    public var decigrams: Measurement<UnitMass> {
        return Measurement(value: self, unit: .decigrams)
    }

    public var centigrams: Measurement<UnitMass> {
        return Measurement(value: self, unit: .centigrams)
    }

    public var milligrams: Measurement<UnitMass> {
        return Measurement(value: self, unit: .milligrams)
    }

    public var micrograms: Measurement<UnitMass> {
        return Measurement(value: self, unit: .micrograms)
    }

    public var nanograms: Measurement<UnitMass> {
        return Measurement(value: self, unit: .nanograms)
    }

    public var picograms: Measurement<UnitMass> {
        return Measurement(value: self, unit: .picograms)
    }

    public var ounces: Measurement<UnitMass> {
        return Measurement(value: self, unit: .ounces)
    }

    public var pounds: Measurement<UnitMass> {
        return Measurement(value: self, unit: .pounds)
    }

    public var stones: Measurement<UnitMass> {
        return Measurement(value: self, unit: .stones)
    }

    public var metricTons: Measurement<UnitMass> {
        return Measurement(value: self, unit: .metricTons)
    }

    public var shortTons: Measurement<UnitMass> {
        return Measurement(value: self, unit: .shortTons)
    }

    public var carats: Measurement<UnitMass> {
        return Measurement(value: self, unit: .carats)
    }

    public var ouncesTroy: Measurement<UnitMass> {
        return Measurement(value: self, unit: .ouncesTroy)
    }

    public var slugs: Measurement<UnitMass> {
        return Measurement(value: self, unit: .slugs)
    }
    
}

// - UnitEnergy: [ML^2/T^2]
@available(iOS 10.0, *)
public extension Double {
    
    public var kilojoules: Measurement<UnitEnergy> {
        return Measurement(value: self, unit: .kilojoules)
    }
    
    public var joules: Measurement<UnitEnergy> {
        return Measurement(value: self, unit: .joules)
    }
    
    public var kilocalories: Measurement<UnitEnergy> {
        return Measurement(value: self, unit: .kilocalories)
    }
    
    public var calories: Measurement<UnitEnergy> {
        return Measurement(value: self, unit: .calories)
    }
    
    public var kilowattHours: Measurement<UnitEnergy> {
        return Measurement(value: self, unit: .kilowattHours)
    }
    
}
