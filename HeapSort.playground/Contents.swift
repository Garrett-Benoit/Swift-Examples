import UIKit

class Heap {
    
    var values: [Int]
    
    init(values: [Int]) {
        self.values = values
    }
    
    func parent(childIndex: Int) -> Int {
        return (childIndex - 1) / 2
    }
    
    func leftChild(parentIndex: Int) -> Int {
        return parentIndex * 2 + 1
    }
    
    func rightChild(parentIndex: Int) -> Int {
        return parentIndex * 2 + 2
    }
    
    func bubbleDown(index: Int) {
        var index = index
        
        while index < values.count {
            
            let leftIndex = leftChild(parentIndex: index)
            let rightIndex = rightChild(parentIndex: index)
            
            if leftIndex >= values.count {
                break
            }
            
            var largerChildIndex = leftIndex
            
            if rightIndex < values.count && values[leftIndex] < values[rightIndex] {
                largerChildIndex = rightIndex
            }
            
            if values[index] < values[largerChildIndex] {
                let tempValue = values[index]
                values[index] = values[largerChildIndex]
                values[largerChildIndex] = tempValue
                print("Swapping index \(index) with index \(largerChildIndex)")
                print("\(values)\n")
                
                bubbleDown(index: parent(childIndex: index))
                
                index = largerChildIndex
            } else {
                break
            }
        }
    }
    
    func heapify() -> [Int] {
        for (index, _) in values.enumerated() {
            print("Index: \(index)\n")
            bubbleDown(index: index)
        }
        return values
    }
}

// Test Data

let testHeap = Heap(values: [4, 2, 6, 1, 3, 5, 7])

print("HEAP SORT")
print("---------------------------------------------\n")
print("Unsorted Heap: \(testHeap.values)\n")
print("---------------------------------------------")
print("STARTING SORT\n")
let sortedHeap = testHeap.heapify()
print("---------------------------------------------\n")
print("Sorted Heap: \(sortedHeap)\n")
print("---------------------------------------------")
