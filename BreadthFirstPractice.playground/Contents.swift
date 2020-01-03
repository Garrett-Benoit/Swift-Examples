import UIKit

class Node {
    
    var data: Int
    var left: Node?
    var right: Node?
    
    init(data: Int) {
        self.data = data
    }
    
    func breadthFirstSearch(for value: Int) -> Bool {
        
        var queue = [self]
        
        while let head = queue.first {
            queue.remove(at: 0)
            
            if (head.data == value) {
                return true //head
            }
            
            if let left = head.left {
                queue.append(left)
            }
            
            if let right = head.right {
                queue.append(right)
            }
        }
        
        return false
    }
}

let testNode = Node(data: 4)
testNode.left = Node(data: 3)
testNode.left?.left = Node(data: 1)
testNode.left?.right = Node(data: 2)
testNode.right = Node(data: 5)
print("\(testNode.breadthFirstSearch(for: 6))")
