import UIKit

class Vehicle {
    
    private let vinNumber: String
    let make: String
    let model: String
    let year: Int
    let color: UIColor
    let mpg: Int
    let doors: Int
    let powerLocks: Bool
    let powerWindows: Bool
    let cylinder: Int
    
    init() {
        self.vinNumber = "JT4RN13P7A0001611"
        self.make = "Manufacturer"
        self.model = "Brand"
        self.year = 2010
        self.color = UIColor.white
        self.mpg = 28
        self.doors = 4
        self.powerLocks = false
        self.powerWindows = false
        self.cylinder = 4
    }
    
    init(vinNumber: String, make: String, model: String, year: Int, color: UIColor, mpg: Int, doors: Int, powerLocks: Bool, powerWindows: Bool, cylinder: Int) {
        self.vinNumber = vinNumber
        self.make = make
        self.model = model
        self.year = year
        self.color = color
        self.mpg = mpg
        self.doors = doors
        self.powerLocks = powerLocks
        self.powerWindows = powerWindows
        self.cylinder = cylinder
    }
    
    func description() -> String {
        return "Vehicle Details:\nMake: \(make)\nModel: \(model)\nYear: \(year)\nMiles Per Gallon: \(mpg)\n\(cylinder) Cylinder\n"
    }
    
    func vehicleIdentificationNumber(authenticationCode: String) -> String? {
        return authenticationCode == "ValueYouShouldNotHardCode" ? vinNumber : nil
    }
}

class Truck: Vehicle {
    
    let extendedCab: Bool
    let fourWheelDrive: Bool
    let towingPackage: Bool
    
    init(vinNumber: String, make: String, model: String, year: Int, color: UIColor, mpg: Int, doors: Int, powerLocks: Bool, powerWindows: Bool, cylinder: Int, extendedCab: Bool, fourWheelDrive: Bool, towingPackage: Bool) {
        self.extendedCab = extendedCab
        self.fourWheelDrive = fourWheelDrive
        self.towingPackage = towingPackage
        super.init(vinNumber: vinNumber, make: make, model: model, year: year, color: color, mpg: mpg, doors: doors, powerLocks: powerLocks, powerWindows: powerWindows, cylinder: cylinder)
    }
    
    override func description() -> String {
        return super.description() + "Extended Cab: \(extendedCab)\nFour Wheel Drive: \(fourWheelDrive)\nTowing Package: \(towingPackage)"
    }
}

class Car: Vehicle {
    
    let convertible: Bool
    let sunroof: Bool
    
    init(vinNumber: String, make: String, model: String, year: Int, color: UIColor, mpg: Int, doors: Int, powerLocks: Bool, powerWindows: Bool, cylinder: Int, convertible: Bool, sunroof: Bool) {
        self.convertible = convertible
        self.sunroof = sunroof
        super.init(vinNumber: vinNumber, make: make, model: model, year: year, color: color, mpg: mpg, doors: doors, powerLocks: powerLocks, powerWindows: powerWindows, cylinder: cylinder)
    }
    
    override func description() -> String {
        return super.description() + "Convertible: \(convertible)\nSunroof: \(sunroof)"
    }
}

let truckOne = Truck(vinNumber: "AA1BBB8KJOPl00010", make: "Toyota", model: "Tacoma", year: 2010, color: UIColor.blue, mpg: 28, doors: 4, powerLocks: true, powerWindows: true, cylinder: 6, extendedCab: false, fourWheelDrive: false, towingPackage: true)

let carOne = Car(vinNumber: "BB2CCC9LZTU299929", make: "Toyota", model: "Camry", year: 2005, color: UIColor.white, mpg: 34, doors: 4, powerLocks: true, powerWindows: true, cylinder: 4, convertible: false, sunroof: true)

print("---------------------------------")
print(truckOne.description())
print("---------------------------------")
print(carOne.description())
print("---------------------------------")
