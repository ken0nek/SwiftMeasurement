/**
 *  SwiftMeasurement
 *
 *  Copyright (c) 2021 Ken Tominaga. Licensed under the MIT license, as follows:
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
public extension Double {

    var degrees: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .degrees)
    }

    var arcMinutes: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .arcMinutes)
    }

    var arcSeconds: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .arcSeconds)
    }

    var radians: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .radians)
    }

    var gradians: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .gradians)
    }

    var revolutions: Measurement<UnitAngle> {
        return Measurement(value: self, unit: .revolutions)
    }

}

// - UnitPressure: [M/LT^2]
public extension Double {

    var newtonsPerMetersSquared: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .newtonsPerMetersSquared)
    }

    var gigapascals: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .gigapascals)
    }

    var megapascals: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .megapascals)
    }

    var kilopascals: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .kilopascals)
    }

    var hectopascals: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .hectopascals)
    }

    var inchesOfMercury: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .inchesOfMercury)
    }

    var bars: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .bars)
    }

    var millibars: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .millibars)
    }

    var millimetersOfMercury: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .millimetersOfMercury)
    }

    var poundsForcePerSquareInch: Measurement<UnitPressure> {
        return Measurement(value: self, unit: .poundsForcePerSquareInch)
    }

}

// - UnitDispersion: []
public extension Double {

    var partsPerMillion: Measurement<UnitDispersion> {
        return Measurement(value: self, unit: .partsPerMillion)
    }

}

// - UnitElectricPotentialDifference: [L^2M/T^3I]
public extension Double {

    var megavolts: Measurement<UnitElectricPotentialDifference> {
        return Measurement(value: self, unit: .megavolts)
    }

    var kilovolts: Measurement<UnitElectricPotentialDifference> {
        return Measurement(value: self, unit: .kilovolts)
    }

    var volts: Measurement<UnitElectricPotentialDifference> {
        return Measurement(value: self, unit: .volts)
    }

    var millivolts: Measurement<UnitElectricPotentialDifference> {
        return Measurement(value: self, unit: .millivolts)
    }

    var microvolts: Measurement<UnitElectricPotentialDifference> {
        return Measurement(value: self, unit: .microvolts)
    }

}

// - UnitDuration: [T]
public extension Double {

    var seconds: Measurement<UnitDuration> {
        return Measurement(value: self, unit: .seconds)
    }

    var minutes: Measurement<UnitDuration> {
        return Measurement(value: self, unit: .minutes)
    }

    var hours: Measurement<UnitDuration> {
        return Measurement(value: self, unit: .hours)
    }

    var milliseconds: Measurement<UnitDuration> {
        return Measurement(value: self, unit: .milliseconds)
    }

    var microseconds: Measurement<UnitDuration> {
        return Measurement(value: self, unit: .microseconds)
    }

    var nanoseconds: Measurement<UnitDuration> {
        return Measurement(value: self, unit: .nanoseconds)
    }

    var picoseconds: Measurement<UnitDuration> {
        return Measurement(value: self, unit: .picoseconds)
    }

}

// - UnitPower: [ML^2/T^3]
public extension Double {

    var terawatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .terawatts)
    }

    var gigawatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .gigawatts)
    }

    var megawatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .megawatts)
    }

    var kilowatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .kilowatts)
    }

    var watts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .watts)
    }

    var milliwatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .milliwatts)
    }

    var microwatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .microwatts)
    }

    var nanowatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .nanowatts)
    }

    var picowatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .picowatts)
    }

    var femtowatts: Measurement<UnitPower> {
        return Measurement(value: self, unit: .femtowatts)
    }

    var horsepower: Measurement<UnitPower> {
        return Measurement(value: self, unit: .horsepower)
    }

}

// - UnitElectricCharge: [IT]
public extension Double {

    var coulombs: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .coulombs)
    }

    var megaampereHours: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .megaampereHours)
    }

    var kiloampereHours: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .kiloampereHours)
    }

    var ampereHours: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .ampereHours)
    }

    var milliampereHours: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .milliampereHours)
    }

    var microampereHours: Measurement<UnitElectricCharge> {
        return Measurement(value: self, unit: .microampereHours)
    }

}

// - UnitAcceleration: [L/T^2]
public extension Double {

    var metersPerSecondSquared: Measurement<UnitAcceleration> {
        return Measurement(value: self, unit: .metersPerSecondSquared)
    }

    var gravity: Measurement<UnitAcceleration> {
        return Measurement(value: self, unit: .gravity)
    }

}

// - UnitTemperature: [Θ]
public extension Double {

    var kelvin: Measurement<UnitTemperature> {
        return Measurement(value: self, unit: .kelvin)
    }

    var celsius: Measurement<UnitTemperature> {
        return Measurement(value: self, unit: .celsius)
    }

    var fahrenheit: Measurement<UnitTemperature> {
        return Measurement(value: self, unit: .fahrenheit)
    }

}

// - UnitIlluminance: [J/L^2]
public extension Double {

    var lux: Measurement<UnitIlluminance> {
        return Measurement(value: self, unit: .lux)
    }

}

// - UnitFrequency: [/T]
public extension Double {

    var terahertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .terahertz)
    }

    var gigahertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .gigahertz)
    }

    var megahertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .megahertz)
    }

    var kilohertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .kilohertz)
    }

    var hertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .hertz)
    }

    var millihertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .millihertz)
    }

    var microhertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .microhertz)
    }

    var nanohertz: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .nanohertz)
    }

    var framesPerSecond: Measurement<UnitFrequency> {
        return Measurement(value: self, unit: .framesPerSecond)
    }

}

// - UnitArea: [L^2]
public extension Double {

    var squareMegameters: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareMegameters)
    }

    var squareKilometers: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareKilometers)
    }

    var squareMeters: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareMeters)
    }

    var squareCentimeters: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareCentimeters)
    }

    var squareMillimeters: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareMillimeters)
    }

    var squareMicrometers: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareMicrometers)
    }

    var squareNanometers: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareNanometers)
    }

    var squareInches: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareInches)
    }

    var squareFeet: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareFeet)
    }

    var squareYards: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareYards)
    }

    var squareMiles: Measurement<UnitArea> {
        return Measurement(value: self, unit: .squareMiles)
    }

    var acres: Measurement<UnitArea> {
        return Measurement(value: self, unit: .acres)
    }

    var ares: Measurement<UnitArea> {
        return Measurement(value: self, unit: .ares)
    }

    var hectares: Measurement<UnitArea> {
        return Measurement(value: self, unit: .hectares)
    }

}

// - UnitLength: [L]
public extension Double {

    var megameters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .megameters)
    }

    var kilometers: Measurement<UnitLength> {
        return Measurement(value: self, unit: .kilometers)
    }

    var hectometers: Measurement<UnitLength> {
        return Measurement(value: self, unit: .hectometers)
    }

    var decameters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .decameters)
    }

    var meters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .meters)
    }

    var decimeters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .decimeters)
    }

    var centimeters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .centimeters)
    }

    var millimeters: Measurement<UnitLength> {
        return Measurement(value: self, unit: .millimeters)
    }

    var micrometers: Measurement<UnitLength> {
        return Measurement(value: self, unit: .micrometers)
    }

    var nanometers: Measurement<UnitLength> {
        return Measurement(value: self, unit: .nanometers)
    }

    var picometers: Measurement<UnitLength> {
        return Measurement(value: self, unit: .picometers)
    }

    var inches: Measurement<UnitLength> {
        return Measurement(value: self, unit: .inches)
    }

    var feet: Measurement<UnitLength> {
        return Measurement(value: self, unit: .feet)
    }

    var yards: Measurement<UnitLength> {
        return Measurement(value: self, unit: .yards)
    }

    var miles: Measurement<UnitLength> {
        return Measurement(value: self, unit: .miles)
    }

    var scandinavianMiles: Measurement<UnitLength> {
        return Measurement(value: self, unit: .scandinavianMiles)
    }

    var lightyears: Measurement<UnitLength> {
        return Measurement(value: self, unit: .lightyears)
    }

    var nauticalMiles: Measurement<UnitLength> {
        return Measurement(value: self, unit: .nauticalMiles)
    }

    var fathoms: Measurement<UnitLength> {
        return Measurement(value: self, unit: .fathoms)
    }

    var furlongs: Measurement<UnitLength> {
        return Measurement(value: self, unit: .furlongs)
    }

    var astronomicalUnits: Measurement<UnitLength> {
        return Measurement(value: self, unit: .astronomicalUnits)
    }

    var parsecs: Measurement<UnitLength> {
        return Measurement(value: self, unit: .parsecs)
    }

}

// - UnitElectricCurrent: [I]
public extension Double {

    var megaamperes: Measurement<UnitElectricCurrent> {
        return Measurement(value: self, unit: .megaamperes)
    }

    var kiloamperes: Measurement<UnitElectricCurrent> {
        return Measurement(value: self, unit: .kiloamperes)
    }

    var amperes: Measurement<UnitElectricCurrent> {
        return Measurement(value: self, unit: .amperes)
    }

    var milliamperes: Measurement<UnitElectricCurrent> {
        return Measurement(value: self, unit: .milliamperes)
    }

    var microamperes: Measurement<UnitElectricCurrent> {
        return Measurement(value: self, unit: .microamperes)
    }

}

// - UnitFuelEfficiency
public extension Double {

    var litersPer100Kilometers: Measurement<UnitFuelEfficiency> {
        return Measurement(value: self, unit: .litersPer100Kilometers)
    }

    var milesPerImperialGallon: Measurement<UnitFuelEfficiency> {
        return Measurement(value: self, unit: .milesPerImperialGallon)
    }

    var milesPerGallon: Measurement<UnitFuelEfficiency> {
        return Measurement(value: self, unit: .milesPerGallon)
    }

}

// - UnitConcentrationMass: [M/L^3]
public extension Double {

    var gramsPerLiter: Measurement<UnitConcentrationMass> {
        return Measurement(value: self, unit: .gramsPerLiter)
    }

    var milligramsPerDeciliter: Measurement<UnitConcentrationMass> {
        return Measurement(value: self, unit: .milligramsPerDeciliter)
    }

}

// - UnitVolume: [L^3]

public extension Double {

    var megaliters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .megaliters)
    }

    var kiloliters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .kiloliters)
    }

    var liters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .liters)
    }

    var deciliters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .deciliters)
    }

    var centiliters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .centiliters)
    }

    var milliliters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .milliliters)
    }

    var cubicKilometers: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicKilometers)
    }

    var cubicMeters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicMeters)
    }

    var cubicDecimeters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicDecimeters)
    }

    var cubicCentimeters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicCentimeters)
    }

    var cubicMillimeters: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicMillimeters)
    }

    var cubicInches: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicInches)
    }

    var cubicFeet: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicFeet)
    }

    var cubicYards: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicYards)
    }

    var cubicMiles: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cubicMiles)
    }

    var acreFeet: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .acreFeet)
    }

    var bushels: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .bushels)
    }

    var teaspoons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .teaspoons)
    }

    var tablespoons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .tablespoons)
    }

    var fluidOunces: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .fluidOunces)
    }

    var cups: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .cups)
    }

    var pints: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .pints)
    }

    var quarts: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .quarts)
    }

    var gallons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .gallons)
    }

    var imperialTeaspoons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialTeaspoons)
    }

    var imperialTablespoons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialTablespoons)
    }

    var imperialFluidOunces: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialFluidOunces)
    }

    var imperialPints: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialPints)
    }

    var imperialQuarts: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialQuarts)
    }

    var imperialGallons: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .imperialGallons)
    }

    var metricCups: Measurement<UnitVolume> {
        return Measurement(value: self, unit: .metricCups)
    }

}

// - UnitSpeed: [L/T]
public extension Double {

    var metersPerSecond: Measurement<UnitSpeed> {
        return Measurement(value: self, unit: .metersPerSecond)
    }

    var kilometersPerHour: Measurement<UnitSpeed> {
        return Measurement(value: self, unit: .kilometersPerHour)
    }

    var milesPerHour: Measurement<UnitSpeed> {
        return Measurement(value: self, unit: .milesPerHour)
    }

    var knots: Measurement<UnitSpeed> {
        return Measurement(value: self, unit: .knots)
    }

}

// - UnitElectricResistance: [L^2M/T^3I^2]
public extension Double {

    var megaohms: Measurement<UnitElectricResistance> {
        return Measurement(value: self, unit: .megaohms)
    }

    var kiloohms: Measurement<UnitElectricResistance> {
        return Measurement(value: self, unit: .kiloohms)
    }

    var ohms: Measurement<UnitElectricResistance> {
        return Measurement(value: self, unit: .ohms)
    }

    var milliohms: Measurement<UnitElectricResistance> {
        return Measurement(value: self, unit: .milliohms)
    }

    var microohms: Measurement<UnitElectricResistance> {
        return Measurement(value: self, unit: .microohms)
    }

}

// - UnitMass: [M]
public extension Double {

    var kilograms: Measurement<UnitMass> {
        return Measurement(value: self, unit: .kilograms)
    }

    var grams: Measurement<UnitMass> {
        return Measurement(value: self, unit: .grams)
    }

    var decigrams: Measurement<UnitMass> {
        return Measurement(value: self, unit: .decigrams)
    }

    var centigrams: Measurement<UnitMass> {
        return Measurement(value: self, unit: .centigrams)
    }

    var milligrams: Measurement<UnitMass> {
        return Measurement(value: self, unit: .milligrams)
    }

    var micrograms: Measurement<UnitMass> {
        return Measurement(value: self, unit: .micrograms)
    }

    var nanograms: Measurement<UnitMass> {
        return Measurement(value: self, unit: .nanograms)
    }

    var picograms: Measurement<UnitMass> {
        return Measurement(value: self, unit: .picograms)
    }

    var ounces: Measurement<UnitMass> {
        return Measurement(value: self, unit: .ounces)
    }

    var pounds: Measurement<UnitMass> {
        return Measurement(value: self, unit: .pounds)
    }

    var stones: Measurement<UnitMass> {
        return Measurement(value: self, unit: .stones)
    }

    var metricTons: Measurement<UnitMass> {
        return Measurement(value: self, unit: .metricTons)
    }

    var shortTons: Measurement<UnitMass> {
        return Measurement(value: self, unit: .shortTons)
    }

    var carats: Measurement<UnitMass> {
        return Measurement(value: self, unit: .carats)
    }

    var ouncesTroy: Measurement<UnitMass> {
        return Measurement(value: self, unit: .ouncesTroy)
    }

    var slugs: Measurement<UnitMass> {
        return Measurement(value: self, unit: .slugs)
    }
    
}

// - UnitEnergy: [ML^2/T^2]
public extension Double {
    
    var kilojoules: Measurement<UnitEnergy> {
        return Measurement(value: self, unit: .kilojoules)
    }
    
    var joules: Measurement<UnitEnergy> {
        return Measurement(value: self, unit: .joules)
    }
    
    var kilocalories: Measurement<UnitEnergy> {
        return Measurement(value: self, unit: .kilocalories)
    }
    
    var calories: Measurement<UnitEnergy> {
        return Measurement(value: self, unit: .calories)
    }
    
    var kilowattHours: Measurement<UnitEnergy> {
        return Measurement(value: self, unit: .kilowattHours)
    }
    
}

// - UnitInformationStorage: []
public extension Double {

    var bytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .bytes)
    }

    var bits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .bits)
    }

    var nibbles: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .nibbles)
    }

    var yottabytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .yottabytes)
    }

    var zettabytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .zettabytes)
    }

    var exabytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .exabytes)
    }

    var petabytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .petabytes)
    }

    var terabytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .terabytes)
    }

    var gigabytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .gigabytes)
    }

    var megabytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .megabytes)
    }

    var kilobytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .kilobytes)
    }

    var yottabits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .yottabits)
    }

    var zettabits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .zettabits)
    }

    var exabits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .exabits)
    }

    var petabits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .petabits)
    }

    var terabits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .terabits)
    }

    var gigabits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .gigabits)
    }

    var megabits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .megabits)
    }

    var kilobits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .kilobits)
    }

    var yobibytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .yobibytes)
    }

    var zebibytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .zebibytes)
    }

    var exbibytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .exbibytes)
    }

    var pebibytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .pebibytes)
    }

    var tebibytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .tebibytes)
    }

    var gibibytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .gibibytes)
    }

    var mebibytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .mebibytes)
    }

    var kibibytes: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .kibibytes)
    }

    var yobibits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .yobibits)
    }

    var zebibits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .zebibits)
    }

    var exbibits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .exbibits)
    }

    var pebibits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .pebibits)
    }

    var tebibits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .tebibits)
    }

    var gibibits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .gibibits)
    }

    var mebibits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .mebibits)
    }

    var kibibits: Measurement<UnitInformationStorage> {
        return Measurement<UnitInformationStorage>(value: self, unit: .kibibits)
    }

}
