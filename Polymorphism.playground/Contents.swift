import UIKit

class Shape {
    
    fileprivate let valueA: Double
    fileprivate let valueB: Double
    fileprivate let valueC: Double
    
    init(valueA: Double, valueB: Double, valueC: Double) {
        self.valueA = valueA
        self.valueB = valueB
        self.valueC = valueC
    }
    
    func calculateArea() -> Double {
        return 0.0
    }
}


class Square: Shape {
    
    let sides: [Double]
    
    init(side: Double) {
        self.sides = [side, side, side, side]
        super.init(valueA: side, valueB: side, valueC: side)
    }
    
    override func calculateArea() -> Double {
        return pow(valueA, 2)
    }
}

class Rectangle: Shape {
    
    let length: Double
    let width: Double
    
    init(length: Double, width: Double) {
        self.length = length
        self.width = width
        super.init(valueA: length, valueB: width, valueC: length)
    }
    
    override func calculateArea() -> Double {
        return valueA * valueB
    }
}

class Parallelogram: Shape {
    
    let base: Double
    let height: Double
    
    init(base: Double, height: Double) {
        self.base = base
        self.height = height
        super.init(valueA: base, valueB: height, valueC: base)
    }
    
    override func calculateArea() -> Double {
        return valueA * valueB
    }
}

class Triangle: Shape {
    
    let sides: [Double]
    
    init(sideOne: Double, sideTwo: Double, sideThree: Double) {
        self.sides = [sideOne, sideTwo, sideThree]
        super.init(valueA: sideOne, valueB: sideTwo, valueC: sideThree)
    }
    
    override func calculateArea() -> Double {
        let s = (valueA + valueB + valueC) / 2
        return sqrt(s * ((s - valueA) * (s - valueB) * (s - valueC)))
    }
}

class Trapezoid: Shape {
    
    let bases: [Double]
    let height: Double
    
    init(baseOne: Double, baseTwo: Double, height: Double) {
        self.bases = [baseOne, baseTwo]
        self.height = height
        super.init(valueA: baseOne, valueB: baseTwo, valueC: height)
    }
    
    override func calculateArea() -> Double {
        return ((valueA + valueB) / 2) * valueC
    }
}


// Test Data
print("----------------------------------------------------------------------------------\n")

let square = Square(side: 20)
print("Area of a square of size \(square.sides[0]) is: \(square.calculateArea())\n")

print("----------------------------------------------------------------------------------\n")

let parallelogram = Parallelogram(base: 30, height: 20)
print("Area of a parallelogram of base \(parallelogram.base) and height \(parallelogram.height) is: \(parallelogram.calculateArea())\n")

print("----------------------------------------------------------------------------------\n")

let triangle = Triangle(sideOne: 25, sideTwo: 45, sideThree: 50)
print("Area of a triangle with sides \(triangle.sides[0]), \(triangle.sides[1]), and \(triangle.sides[2]) is: \(triangle.calculateArea())\n")

print("----------------------------------------------------------------------------------\n")

let trapezoid = Trapezoid(baseOne: 30, baseTwo: 45, height: 20)
print("Area of a trapezoid with bases \(trapezoid.bases[0]) and \(trapezoid.bases[1]) and a height of \(trapezoid.height) is: \(trapezoid.calculateArea())\n")

print("----------------------------------------------------------------------------------")
