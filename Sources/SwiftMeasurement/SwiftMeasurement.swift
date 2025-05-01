import Foundation

// MARK: - UnitDispersion
public extension MeasurementConvertible {

    var partsPerMillion: Measurement<UnitDispersion> {
        return measurement(as: UnitDispersion.partsPerMillion)
    }
}

// MARK: - UnitElectricPotentialDifference
public extension MeasurementConvertible {

    var megavolts: Measurement<UnitElectricPotentialDifference> {
        return measurement(as: UnitElectricPotentialDifference.megavolts)
    }

    var kilovolts: Measurement<UnitElectricPotentialDifference> {
        return measurement(as: UnitElectricPotentialDifference.kilovolts)
    }

    var volts: Measurement<UnitElectricPotentialDifference> {
        return measurement(as: UnitElectricPotentialDifference.volts)
    }

    var millivolts: Measurement<UnitElectricPotentialDifference> {
        return measurement(as: UnitElectricPotentialDifference.millivolts)
    }

    var microvolts: Measurement<UnitElectricPotentialDifference> {
        return measurement(as: UnitElectricPotentialDifference.microvolts)
    }
}

// MARK: - UnitDuration
public extension MeasurementConvertible {

    var seconds: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.seconds)
    }

    var minutes: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.minutes)
    }

    var hours: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.hours)
    }

    var milliseconds: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.milliseconds)
    }

    var microseconds: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.microseconds)
    }

    var nanoseconds: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.nanoseconds)
    }

    var picoseconds: Measurement<UnitDuration> {
        return measurement(as: UnitDuration.picoseconds)
    }

}

// MARK: - UnitPower
public extension MeasurementConvertible {

    var terawatts: Measurement<UnitPower> {
        return measurement(as: UnitPower.terawatts)
    }

    var gigawatts: Measurement<UnitPower> {
        return measurement(as: UnitPower.gigawatts)
    }

    var megawatts: Measurement<UnitPower> {
        return measurement(as: UnitPower.megawatts)
    }

    var kilowatts: Measurement<UnitPower> {
        return measurement(as: UnitPower.kilowatts)
    }

    var watts: Measurement<UnitPower> {
        return measurement(as: UnitPower.watts)
    }

    var milliwatts: Measurement<UnitPower> {
        return measurement(as: UnitPower.milliwatts)
    }

    var microwatts: Measurement<UnitPower> {
        return measurement(as: UnitPower.microwatts)
    }

    var nanowatts: Measurement<UnitPower> {
        return measurement(as: UnitPower.nanowatts)
    }

    var picowatts: Measurement<UnitPower> {
        return measurement(as: UnitPower.picowatts)
    }

    var femtowatts: Measurement<UnitPower> {
        return measurement(as: UnitPower.femtowatts)
    }

    var horsepower: Measurement<UnitPower> {
        return measurement(as: UnitPower.horsepower)
    }
}

// MARK: - UnitElectricCharge
public extension MeasurementConvertible {

    var coulombs: Measurement<UnitElectricCharge> {
        return measurement(as: UnitElectricCharge.coulombs)
    }

    var megaampereHours: Measurement<UnitElectricCharge> {
        return measurement(as: UnitElectricCharge.megaampereHours)
    }

    var kiloampereHours: Measurement<UnitElectricCharge> {
        return measurement(as: UnitElectricCharge.kiloampereHours)
    }

    var ampereHours: Measurement<UnitElectricCharge> {
        return measurement(as: UnitElectricCharge.ampereHours)
    }

    var milliampereHours: Measurement<UnitElectricCharge> {
        return measurement(as: UnitElectricCharge.milliampereHours)
    }

    var microampereHours: Measurement<UnitElectricCharge> {
        return measurement(as: UnitElectricCharge.microampereHours)
    }
}

// MARK: - UnitAcceleration
public extension MeasurementConvertible {

    var metersPerSecondSquared: Measurement<UnitAcceleration> {
        return measurement(as: UnitAcceleration.metersPerSecondSquared)
    }

    var gravity: Measurement<UnitAcceleration> {
        return measurement(as: UnitAcceleration.gravity)
    }
}

// MARK: - UnitTemperature
public extension MeasurementConvertible {

    var kelvin: Measurement<UnitTemperature> {
        return measurement(as: UnitTemperature.kelvin)
    }

    var celsius: Measurement<UnitTemperature> {
        return measurement(as: UnitTemperature.celsius)
    }

    var fahrenheit: Measurement<UnitTemperature> {
        return measurement(as: UnitTemperature.fahrenheit)
    }
}

// MARK: - UnitIlluminance
public extension MeasurementConvertible {

    var lux: Measurement<UnitIlluminance> {
        return measurement(as: UnitIlluminance.lux)
    }
}

// MARK: - UnitFrequency
public extension MeasurementConvertible {

    var terahertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.terahertz)
    }

    var gigahertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.gigahertz)
    }

    var megahertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.megahertz)
    }

    var kilohertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.kilohertz)
    }

    var hertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.hertz)
    }

    var millihertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.millihertz)
    }

    var microhertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.microhertz)
    }

    var nanohertz: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.nanohertz)
    }

    var framesPerSecond: Measurement<UnitFrequency> {
        return measurement(as: UnitFrequency.framesPerSecond)
    }
}

// MARK: - UnitArea
public extension MeasurementConvertible {

    var squareMegameters: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareMegameters)
    }

    var squareKilometers: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareKilometers)
    }

    var squareMeters: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareMeters)
    }

    var squareCentimeters: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareCentimeters)
    }

    var squareMillimeters: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareMillimeters)
    }

    var squareMicrometers: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareMicrometers)
    }

    var squareNanometers: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareNanometers)
    }

    var squareInches: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareInches)
    }

    var squareFeet: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareFeet)
    }

    var squareYards: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareYards)
    }

    var squareMiles: Measurement<UnitArea> {
        return measurement(as: UnitArea.squareMiles)
    }

    var acres: Measurement<UnitArea> {
        return measurement(as: UnitArea.acres)
    }

    var ares: Measurement<UnitArea> {
        return measurement(as: UnitArea.ares)
    }

    var hectares: Measurement<UnitArea> {
        return measurement(as: UnitArea.hectares)
    }
}

// MARK: - UnitLength
public extension MeasurementConvertible {

    var megameters: Measurement<UnitLength> {
        return measurement(as: UnitLength.megameters)
    }

    var kilometers: Measurement<UnitLength> {
        return measurement(as: UnitLength.kilometers)
    }

    var hectometers: Measurement<UnitLength> {
        return measurement(as: UnitLength.hectometers)
    }

    var decameters: Measurement<UnitLength> {
        return measurement(as: UnitLength.decameters)
    }

    var meters: Measurement<UnitLength> {
        return measurement(as: UnitLength.meters)
    }

    var decimeters: Measurement<UnitLength> {
        return measurement(as: UnitLength.decimeters)
    }

    var centimeters: Measurement<UnitLength> {
        return measurement(as: UnitLength.centimeters)
    }

    var millimeters: Measurement<UnitLength> {
        return measurement(as: UnitLength.millimeters)
    }

    var micrometers: Measurement<UnitLength> {
        return measurement(as: UnitLength.micrometers)
    }

    var nanometers: Measurement<UnitLength> {
        return measurement(as: UnitLength.nanometers)
    }

    var picometers: Measurement<UnitLength> {
        return measurement(as: UnitLength.picometers)
    }

    var inches: Measurement<UnitLength> {
        return measurement(as: UnitLength.inches)
    }

    var feet: Measurement<UnitLength> {
        return measurement(as: UnitLength.feet)
    }

    var yards: Measurement<UnitLength> {
        return measurement(as: UnitLength.yards)
    }

    var miles: Measurement<UnitLength> {
        return measurement(as: UnitLength.miles)
    }

    var scandinavianMiles: Measurement<UnitLength> {
        return measurement(as: UnitLength.scandinavianMiles)
    }

    var lightyears: Measurement<UnitLength> {
        return measurement(as: UnitLength.lightyears)
    }

    var nauticalMiles: Measurement<UnitLength> {
        return measurement(as: UnitLength.nauticalMiles)
    }

    var fathoms: Measurement<UnitLength> {
        return measurement(as: UnitLength.fathoms)
    }

    var furlongs: Measurement<UnitLength> {
        return measurement(as: UnitLength.furlongs)
    }

    var astronomicalUnits: Measurement<UnitLength> {
        return measurement(as: UnitLength.astronomicalUnits)
    }

    var parsecs: Measurement<UnitLength> {
        return measurement(as: UnitLength.parsecs)
    }
}

// MARK: - UnitElectricCurrent
public extension MeasurementConvertible {

    var megaamperes: Measurement<UnitElectricCurrent> {
        return measurement(as: UnitElectricCurrent.megaamperes)
    }

    var kiloamperes: Measurement<UnitElectricCurrent> {
        return measurement(as: UnitElectricCurrent.kiloamperes)
    }

    var amperes: Measurement<UnitElectricCurrent> {
        return measurement(as: UnitElectricCurrent.amperes)
    }

    var milliamperes: Measurement<UnitElectricCurrent> {
        return measurement(as: UnitElectricCurrent.milliamperes)
    }

    var microamperes: Measurement<UnitElectricCurrent> {
        return measurement(as: UnitElectricCurrent.microamperes)
    }
}

// MARK: - UnitFuelEfficiency
public extension MeasurementConvertible {

    var litersPer100Kilometers: Measurement<UnitFuelEfficiency> {
        return measurement(as: UnitFuelEfficiency.litersPer100Kilometers)
    }

    var milesPerImperialGallon: Measurement<UnitFuelEfficiency> {
        return measurement(as: UnitFuelEfficiency.milesPerImperialGallon)
    }

    var milesPerGallon: Measurement<UnitFuelEfficiency> {
        return measurement(as: UnitFuelEfficiency.milesPerGallon)
    }
}

// MARK: - UnitConcentrationMass
public extension MeasurementConvertible {

    var gramsPerLiter: Measurement<UnitConcentrationMass> {
        return measurement(as: UnitConcentrationMass.gramsPerLiter)
    }

    var milligramsPerDeciliter: Measurement<UnitConcentrationMass> {
        return measurement(as: UnitConcentrationMass.milligramsPerDeciliter)
    }
}

// MARK: - UnitVolume

public extension MeasurementConvertible {

    var megaliters: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.megaliters)
    }

    var kiloliters: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.kiloliters)
    }

    var liters: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.liters)
    }

    var deciliters: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.deciliters)
    }

    var centiliters: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.centiliters)
    }

    var milliliters: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.milliliters)
    }

    var cubicKilometers: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.cubicKilometers)
    }

    var cubicMeters: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.cubicMeters)
    }

    var cubicDecimeters: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.cubicDecimeters)
    }

    var cubicCentimeters: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.cubicCentimeters)
    }

    var cubicMillimeters: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.cubicMillimeters)
    }

    var cubicInches: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.cubicInches)
    }

    var cubicFeet: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.cubicFeet)
    }

    var cubicYards: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.cubicYards)
    }

    var cubicMiles: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.cubicMiles)
    }

    var acreFeet: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.acreFeet)
    }

    var bushels: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.bushels)
    }

    var teaspoons: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.teaspoons)
    }

    var tablespoons: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.tablespoons)
    }

    var fluidOunces: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.fluidOunces)
    }

    var cups: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.cups)
    }

    var pints: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.pints)
    }

    var quarts: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.quarts)
    }

    var gallons: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.gallons)
    }

    var imperialTeaspoons: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.imperialTeaspoons)
    }

    var imperialTablespoons: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.imperialTablespoons)
    }

    var imperialFluidOunces: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.imperialFluidOunces)
    }

    var imperialPints: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.imperialPints)
    }

    var imperialQuarts: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.imperialQuarts)
    }

    var imperialGallons: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.imperialGallons)
    }

    var metricCups: Measurement<UnitVolume> {
        return measurement(as: UnitVolume.metricCups)
    }
}

// MARK: - UnitSpeed
public extension MeasurementConvertible {

    var metersPerSecond: Measurement<UnitSpeed> {
        return measurement(as: UnitSpeed.metersPerSecond)
    }

    var kilometersPerHour: Measurement<UnitSpeed> {
        return measurement(as: UnitSpeed.kilometersPerHour)
    }

    var milesPerHour: Measurement<UnitSpeed> {
        return measurement(as: UnitSpeed.milesPerHour)
    }

    var knots: Measurement<UnitSpeed> {
        return measurement(as: UnitSpeed.knots)
    }
}

// MARK: - UnitElectricResistance
public extension MeasurementConvertible {

    var megaohms: Measurement<UnitElectricResistance> {
        return measurement(as: UnitElectricResistance.megaohms)
    }

    var kiloohms: Measurement<UnitElectricResistance> {
        return measurement(as: UnitElectricResistance.kiloohms)
    }

    var ohms: Measurement<UnitElectricResistance> {
        return measurement(as: UnitElectricResistance.ohms)
    }

    var milliohms: Measurement<UnitElectricResistance> {
        return measurement(as: UnitElectricResistance.milliohms)
    }

    var microohms: Measurement<UnitElectricResistance> {
        return measurement(as: UnitElectricResistance.microohms)
    }
}

// MARK: - UnitMass
public extension MeasurementConvertible {

    var kilograms: Measurement<UnitMass> {
        return measurement(as: UnitMass.kilograms)
    }

    var grams: Measurement<UnitMass> {
        return measurement(as: UnitMass.grams)
    }

    var decigrams: Measurement<UnitMass> {
        return measurement(as: UnitMass.decigrams)
    }

    var centigrams: Measurement<UnitMass> {
        return measurement(as: UnitMass.centigrams)
    }

    var milligrams: Measurement<UnitMass> {
        return measurement(as: UnitMass.milligrams)
    }

    var micrograms: Measurement<UnitMass> {
        return measurement(as: UnitMass.micrograms)
    }

    var nanograms: Measurement<UnitMass> {
        return measurement(as: UnitMass.nanograms)
    }

    var picograms: Measurement<UnitMass> {
        return measurement(as: UnitMass.picograms)
    }

    var ounces: Measurement<UnitMass> {
        return measurement(as: UnitMass.ounces)
    }

    var pounds: Measurement<UnitMass> {
        return measurement(as: UnitMass.pounds)
    }

    var stones: Measurement<UnitMass> {
        return measurement(as: UnitMass.stones)
    }

    var metricTons: Measurement<UnitMass> {
        return measurement(as: UnitMass.metricTons)
    }

    var shortTons: Measurement<UnitMass> {
        return measurement(as: UnitMass.shortTons)
    }

    var carats: Measurement<UnitMass> {
        return measurement(as: UnitMass.carats)
    }

    var ouncesTroy: Measurement<UnitMass> {
        return measurement(as: UnitMass.ouncesTroy)
    }

    var slugs: Measurement<UnitMass> {
        return measurement(as: UnitMass.slugs)
    }
}

// MARK: - UnitEnergy
public extension MeasurementConvertible {

    var kilojoules: Measurement<UnitEnergy> {
        return measurement(as: UnitEnergy.kilojoules)
    }

    var joules: Measurement<UnitEnergy> {
        return measurement(as: UnitEnergy.joules)
    }

    var kilocalories: Measurement<UnitEnergy> {
        return measurement(as: UnitEnergy.kilocalories)
    }

    var calories: Measurement<UnitEnergy> {
        return measurement(as: UnitEnergy.calories)
    }

    var kilowattHours: Measurement<UnitEnergy> {
        return measurement(as: UnitEnergy.kilowattHours)
    }
}

// MARK: - UnitInformationStorage
public extension MeasurementConvertible {

    var bytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.bytes)
    }

    var bits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.bits)
    }

    var nibbles: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.nibbles)
    }

    var yottabytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.yottabytes)
    }

    var zettabytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.zettabytes)
    }

    var exabytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.exabytes)
    }

    var petabytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.petabytes)
    }

    var terabytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.terabytes)
    }

    var gigabytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.gigabytes)
    }

    var megabytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.megabytes)
    }

    var kilobytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.kilobytes)
    }

    var yottabits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.yottabits)
    }

    var zettabits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.zettabits)
    }

    var exabits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.exabits)
    }

    var petabits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.petabits)
    }

    var terabits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.terabits)
    }

    var gigabits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.gigabits)
    }

    var megabits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.megabits)
    }

    var kilobits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.kilobits)
    }

    var yobibytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.yobibytes)
    }

    var zebibytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.zebibytes)
    }

    var exbibytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.exbibytes)
    }

    var pebibytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.pebibytes)
    }

    var tebibytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.tebibytes)
    }

    var gibibytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.gibibytes)
    }

    var mebibytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.mebibytes)
    }

    var kibibytes: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.kibibytes)
    }

    var yobibits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.yobibits)
    }

    var zebibits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.zebibits)
    }

    var exbibits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.exbibits)
    }

    var pebibits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.pebibits)
    }

    var tebibits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.tebibits)
    }

    var gibibits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.gibibits)
    }

    var mebibits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.mebibits)
    }

    var kibibits: Measurement<UnitInformationStorage> {
        return measurement(as: UnitInformationStorage.kibibits)
    }
}
