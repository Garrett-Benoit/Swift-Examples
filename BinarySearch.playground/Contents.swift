import UIKit

func binarySearch(array: [Int], for value: Int) -> Bool {
    if array.count <= 2 {
        if let lastValue = array.first, lastValue == value {
            print("Final Value Found: \(lastValue)")
            return true
        } else if let lastValue = array.last, lastValue == value {
            print("Final Value Found: \(lastValue)")
            return true
        } else {
            print("\(value) does not exist in the array")
            return false
        }
    } else {
        if (array.count - 1 / 2) % 2 == 0 {
            let index = (array.count - 1) / 2
            let mid = array[index]
            if mid == value {
                print("Final Value Found: \(mid)")
                return true
            } else if mid > value {
                // LHS
                let lhs = Array(array[0..<index + 1])
                print("Got LHS: ", lhs)
                return binarySearch(array: lhs, for: value)
            } else {
                // RHS
                let rhs = Array(array[index + 1..<array.count])
                print("Got RHS: ", rhs)
                return binarySearch(array: rhs, for: value)
            }
        } else {
            let index = (array.count - 2) / 2
            let mid = array[index]
            if mid == value {
                print("Final Value Found: \(mid)")
                return true
            } else if mid > value {
                // LHS
                let lhs = Array(array[0..<index + 1])
                print("Got LHS: ", lhs)
                return binarySearch(array: lhs, for: value)
            } else {
                // RHS
                let rhs = Array(array[index + 1..<array.count])
                print("Got RHS: ", rhs)
                return binarySearch(array: rhs, for: value)
            }
        }
    }
}


// Test Data
let testArray = [0, 2, 7, 12, 13, 19, 34, 42, 91, 102, 112, 145, 189, 215, 248, 412]
binarySearch(array: testArray, for: 214)
