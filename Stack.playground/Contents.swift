import UIKit

class Stack {
    
    private var values = [Int?]()
    private var top = 0
    
    init(size: Int) {
        values = [Int?](repeating: nil, count: size)
        print("Stack initialized with maximum item count of \(size)\n")
    }
    
    func push(value: Int) {
        if top < values.capacity {
            values[top] = value
            top += 1
        } else {
            print("Stack Overflow")
        }
    }
    
    func pop() -> Int? {
        if top > 0 {
            top -= 1
            let popped = values[top]
            values[top] = nil
            return popped
        } else {
            return nil
        }
    }
    
    func peek() -> Int? {
        return values[top - 1]
    }
    
    func isEmpty() -> Bool {
        return top == 0
    }
    
    func printStack() {
        for value in values.reversed() {
            if let value = value {
                print("\(value)")
            }
        }
    }
}



// Test Data

let stack = Stack(size: 5)

stack.push(value: 8)
stack.push(value: 12)
stack.push(value: 85)

print("---------------------------")
stack.printStack()

print("---------------------------")
print("Popped: \(stack.pop())")

print("---------------------------")
stack.printStack()

print("---------------------------")
stack.push(value: 182)
stack.printStack()

print("---------------------------")
stack.push(value: 9)
stack.printStack()

print("---------------------------")
print("Peek: \(stack.peek())")

print("---------------------------")
stack.push(value: 13)
stack.printStack()

print("---------------------------")
stack.push(value: 24)
stack.printStack()
