import UIKit

class Node {
    
    let key: Int
    let left: Node?
    let right: Node?
    let level: Int
    
    init(key: Int, left: Node?, right: Node?, level: Int) {
        self.key = key
        self.left = left
        self.right = right
        self.level = level
    }
    
    func depthFirstSearch(for value: Int) {
        
        print("Current Node Value: \(key) at level \(level)")
        
        if key == value {
            print("Value found: \(key) at level \(level)")
        } else {
            if let left = self.left {
                left.depthFirstSearch(for: value)
            }
            
            if let right = self.right {
                right.depthFirstSearch(for: value)
            }
        }
    }
}


// Test Data
let testTree = Node(key: 4, left: Node(key: 2, left: Node(key: 1, left: nil, right: nil, level: 3), right: Node(key: 3, left: nil, right: nil, level: 3), level: 2), right: Node(key: 6, left: Node(key: 5, left: nil, right: nil, level: 3), right: Node(key: 7, left: nil, right: nil, level: 3), level: 2), level: 1)

testTree.depthFirstSearch(for: 6)
