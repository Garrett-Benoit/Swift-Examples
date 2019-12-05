import UIKit

class Node {
    
    var data: Int
    var left: Node?
    var right: Node?
    
    init(data: Int) {
        self.data = data
    }
}

class BinarySearchTree {
    
    var root: Node?
    
    init() {
        // Initializing an empty BST
    }
    
    func breadthFirstSearch() {
        let height = treeHeight(node: root)
        var level = 1
        while level <= height {
            print("Level \(level)")
            printLevel(node: root, level: level)
            level += 1
        }
    }
    
    private func printLevel(node: Node?, level: Int) {
        if let node = node {
            if level == 1 {
                print("\(node.data)")
            } else if level > 1 {
                printLevel(node: node.left, level: level - 1)
                printLevel(node: node.right, level: level - 1)
            }
        }
    }
    
    private func treeHeight(node: Node?) -> Int {
        if let node = node {
            let leftHeight = treeHeight(node: node.left)
            let rightHeight = treeHeight(node: node.right)
            if leftHeight > rightHeight {
                return leftHeight + 1
            } else {
                return rightHeight + 1
            }
        } else {
            return 0
        }
    }
}



// Test Data

let binarySearchTree = BinarySearchTree()

binarySearchTree.root = Node(data: 1)
binarySearchTree.root?.left = Node(data: 2)
binarySearchTree.root?.right = Node(data: 3)
binarySearchTree.root?.left?.left = Node(data: 4)
binarySearchTree.root?.left?.right = Node(data: 5)
binarySearchTree.root?.left?.left?.left = Node(data: 6)
binarySearchTree.root?.left?.left?.right = Node(data: 7)
binarySearchTree.root?.left?.right?.left = Node(data: 8)
binarySearchTree.root?.left?.right?.right = Node(data: 9)

print("-----------------------")
print("Breadth First Search (Using Recursion At Each Level)")
print("-----------------------")
binarySearchTree.breadthFirstSearch()
print("-----------------------")
